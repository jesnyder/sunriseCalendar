
import pandas as pd
import requests
import time




def main():
    """

    """

    print("hello")


    # scrape noaa
    # out = scrape_noaa()

    # quantify timestamps 
    # quantify_out(out)


    # write openscad 
    write_openscad()




def write_openscad():
    """

    """


    src_cad = "example.scad"
    
    with open(src_cad, "r") as f:
        lines = f.readlines()
        f.close()

    model = []
    for line in lines: 
        print(line)

        if "// add values scraped from NOAA" in str(line): 
            model.append(line)

            model = append_measurements(model)
            break

        model.append(line)



    # write the new lines to the same file
    with open(src_cad, "w") as f:
        for line in model: 
            f.write(line)
        f.close()
    


def append_measurements(model):
    """

    """
    print("appending model")

    df = pd.read_csv("solarcalc_mins.csv")
    print(df)

    sunrise = list(df["SunriseTime"])
    noon = list(df["SolarNoonTime"])
    sunset = list(df["SunsetTime"])
    year = list(df["Year"])
    month = list(df["Month"])
    day = list(df["Day"])

    print(max(sunset))
    print(min(sunrise))
    print(max(noon))



    count = 0
    for k in range(len(sunrise)):

        if k%7 != 0: continue 
        count = count + 1
        #print("count = " + str(count))

        i = int(count/8)
        j = count%8

        new_line = "\n"
        model.append(new_line)

        date = str(str(year[k]) + " " + str(month[k]) + " " + str(day[k]))
        new_line = str("// " + date + "\n")
        model.append(new_line)

        new_line = str("build_panel(" + str(i) + ", " + str(j) + ", " + str(sunrise[k]) + ", " + str(noon[k]) + ", " + str(sunset[k]) + ", \"" + date + "\"); \n")
        model.append(new_line)

    return(model)








def quantify_out(out):
    """
    assign geometric numbers to solar times
    """

    print(out)

    sets = list(out["Sunset"])
    rises = list(out["Sunrise"])
    noons = list(out["SolarNoon"])

    out["SunriseTime"] = calculate_mins(rises)
    out["SolarNoonTime"] = calculate_mins(noons)
    out["SunsetTime"] = calculate_mins(sets)


    out.to_csv('solarcalc_mins.csv', index=False)






def calculate_mins(noons):
    """
    return list of hours or minutes since midnight of the event
    """    

    times = []
    for noon in noons:
        print(noon)

        splits = noon.split(":")
        print(splits)

        if len(splits) == 2: splits = [splits[0], splits[1], 0]

        time = float(splits[0]) + float(splits[1])/60 + float(splits[2])/60/60 
        times.append(time)
        
        #print(mins)

    
    return(times)








def scrape_noaa():
    """

    """

    headers = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/109.0'}

    # Fill this table with your counties
    counties = {
        #'NY': {'lat': 40.72, 'lon': -74.02},
        #'LA': {'lat': 37.77, 'lon': -122.42},
        'SF': {'lat': 37.773972, 'lon': 122.431297}
    }

    url = 'https://gml.noaa.gov/grad/solcalc/table.php'

    dataset = []
    for year in range(2023, 2024):
        for county, params in counties.items():
            print(year, county)
            payload = params | {'year': year}
            r = requests.get(url, headers=headers, params=payload)
            dfs = pd.read_html(r.text)

            print(dfs)

            # Reshape your data
            dfs = (pd.concat(dfs, keys=['Sunrise', 'Sunset', 'SolarNoon']).droplevel(1)
                    .assign(Year=year, Lat=params['lat'], Lon=params['lon'])
                    .set_index(['Lat', 'Lon', 'Year', 'Day'], append=True)
                    .rename_axis(columns='Month').stack('Month')
                    .unstack(level=0).reset_index())
            dataset.append(dfs)
            time.sleep(10)  # Wait at least 10 seconds not to be banned

    out = pd.concat(dataset, ignore_index=True)
    out.to_csv('solarcalc.csv', index=False)

    return(out)




if __name__ == "__main__":
    main()