//
//  Attractions.swift
//  Chi Trip
//
//  Created by Gabbie on 7/24/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import SwiftyJSON
import MapKit
import AddressBook

class Attraction: NSObject, MKAnnotation {
    
    
    let name: String
    
    var title: String? {
        return self.name
    }
    
    let imageURL: String
    let whatDescription: String
    let whyDescription: String
    let address: String
    let coordinate: CLLocationCoordinate2D
    
    
    init(name: String, imageURL: String, whatDescription: String, whyDescription: String, address: String, coordinate: CLLocationCoordinate2D)
    {
        self.name = name
        self.imageURL = imageURL
        self.whatDescription = whatDescription
        self.whyDescription = whyDescription
        self.address = address
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return name
    }
    

    func mapItem() -> MKMapItem
    {
        let addressDictionary = [String(kABPersonAddressStreetKey) : name]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)

        mapItem.name = "\(name)"

        return mapItem
    }
}


var listOfAttractions = [
    Attraction(
        name: "Millennium Park",
        imageURL: "https://upload.wikimedia.org/wikipedia/en/thumb/c/c1/Cloud_Gate_%28The_Bean%29_from_east%27.jpg/337px-Cloud_Gate_%28The_Bean%29_from_east%27.jpg",
        whatDescription: "This 24.5-acre section of Chicago’s front yard is one of the most popular places to spend time outdoors in the city, look at public art and attend special events.",
        whyDescription: "Take a selfie in front of Cloud Gate (a.k.a. the Bean), go for a stroll through the serene Lurie Gardens, catch a free concert in the Frank Gehry-designed Jay Pritzker Pavilion (in the summer) or skate on the McCormick Tribune Ice Rink (in the winter).",
        address: "201 E Randolph St",
        coordinate: CLLocationCoordinate2D(latitude: 41.8826, longitude: -87.6226)
    ),
    Attraction(
        name: "Art Institute of Chicago",
        imageURL: "https://c1.staticflickr.com/1/23/116815265_f37e129741_b.jpg",
        whatDescription: "One of the city’s most well-known cultural institutions, which houses more than 300,000 artworks and an on-site restaurant, Terzo Piano.",
        whyDescription: "Acquaint yourself with classic paintings like Georges Seurat’s A Sunday on La Grande Jatte (as seen in Ferris Bueller’s Day Off) and Grant Wood's American Gothic or explore an expansive collection of contemporary works in the museum’s Modern Wing.",
        address: "111 S Michigan Ave, Chicago, IL 60603",
        coordinate: CLLocationCoordinate2D(latitude: 41.8796, longitude: -87.6237)
    ),
    Attraction(
        name: "Wrigley Field",
        imageURL: "https://cdn.pixabay.com/photo/2017/05/26/04/45/cubs-2345148_960_720.jpg",
        whatDescription: "Built in 1914, Wrigley Field has been the home of North Side baseball team the Chicago Cubs for more than 100 years.",
        whyDescription: "Watch baseball at one of the oldest ballparks in America, sing along during the seventh-inning stretch and see one of the only manually operated scoreboards in existence, controlled by three members of the Cubs staff.",
        address: "1060 W Addison St, Chicago, IL 60613",
        coordinate: CLLocationCoordinate2D(latitude: 41.9484, longitude: -87.6553)
    ),
    Attraction(
        name: "Garfield Park Conservatory",
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/9/93/Garfield_Park_Conservatory_kz15.jpg",
        whatDescription: "Among the largest conservatories in the United States, this giant greenhouse in Garfield Park provides a home for some 600 species of plants (most of which aren’t indigenous to the region).",
        whyDescription: "Stop by 365 days a year to admire the gigantic trees that fill the Palm Room, see a depiction of ancient Illinois vegetation in the Fern Room or window shop for succulents and cacti in the Desert Room.",
        address: "300 N Central Park Ave, Chicago, IL 60624",
        coordinate: CLLocationCoordinate2D(latitude: 41.8863, longitude: -87.7173)
    ),
    Attraction(
        name: "Lincoln Park Zoo",
        imageURL: "https://c1.staticflickr.com/8/7747/17562834949_9f8f4d95f1_b.jpg",
        whatDescription: "Located in the middle of Lincoln Park, this 35-acre zoo houses more than 1,000 animals and is one of the few remaining free zoos in the country.",
        whyDescription: "Watch cute African penguins frolicking in Penguin Cove, observe majestic cats in the Kovler Lion House or visit the scaled residents of the McCormick Reptile House—all entirely free of charge.",
        address: "2001 N Clark St, Chicago, IL 60614",
        coordinate: CLLocationCoordinate2D(latitude: 41.9211, longitude: -87.6340)
    ),
    Attraction(
        name: "The Second City",
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/d/d8/Second_City._Old_Town%2C_Chicago.jpg",
        whatDescription: "Bill Murray, Tina Fey, Stephen Colbert and Joan Rivers are just a few of the famous folks who honed their talents onstage at this theater devoted to sketch and improvised comedy.",
        whyDescription: "You’ll see some of the most talented rising comedic talents (and maybe a couple future Saturday Night Live cast members) on the Second City’s Mainstage. If you want to learn more about improv, stand-up or sketch writing, you can sign up for a class at the Training Center.",
        address: "1616 N Wells St, Chicago, IL 60614",
        coordinate: CLLocationCoordinate2D(latitude: 41.9115, longitude: -87.6354)
    ),
    Attraction(
        name: "The Field Museum",
        imageURL: "https://c1.staticflickr.com/7/6017/5916893509_8e9fb0fbee_b.jpg",
        whatDescription: "Founded to house the biological and anthropological collections assembled for the World’s Columbian Exposition of 1893, this massive natural history museum has more dinosaur bones and ancient artifacts than any other institution in Chicago.",
        whyDescription: "Take a trip to the past by descending into a recreation of an ancient Egyptian tomb, explore a vast collection of taxidermy or stare at the sparkling stones in the Grainger Hall of Gems.",
        address: "1400 S Lake Shore Dr, Chicago, IL 60605",
        coordinate: CLLocationCoordinate2D(latitude: 41.8663, longitude: -87.6170)
    ),
    Attraction(
        name: "Chicago Riverwalk",
        imageURL: "https://c1.staticflickr.com/1/434/18870168669_1de866d04a_b.jpg",
        whatDescription: "Hugging the banks of the main branch of the Chicago River, the Riverwalk provides a pedestrian path along the city’s most popular waterway, lined with restaurants, bars and gathering spaces.",
        whyDescription: "The waterside walkway allows you to see observe some of the city’s most gorgeous architecture from a new perspective. You can also sip a glass of merlot at City Winery or board a Water Taxi for a leisurely trip to Chinatown.",
        address: "Chicago Riverwalk, Chicago, IL 60601",
        coordinate: CLLocationCoordinate2D(latitude: 41.8882, longitude: -87.6212)
    ),
    Attraction(
        name: "Museum of Contemporary Art",
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/f/f1/1999chicago1A01.jpg",
        whatDescription: "Hosting one of the largest collections of contemporary art in the United States, this Chicago museum is a destination for cutting edge exhibitions and programming.",
        whyDescription: "Take in a constantly changing lineup of exhibitions, including touring shows from the likes of Takashi Murakami and Kerry James Marshall, or stop by the museum’s in-house restaurant, Marisol, where chef Lula Cafe chef Jason Hammel serves an inventive menu.",
        address: "220 E Chicago Ave, Chicago, IL 60611",
        coordinate: CLLocationCoordinate2D(latitude: 41.8972, longitude: -87.6213)
    ),
    Attraction(
        name: "Shedd Aquarium",
        imageURL: "https://c1.staticflickr.com/3/2102/2069295788_0d9dc73ae0_b.jpg",
        whatDescription: "This Museum Campus staple is the home to thousands of aquatic creatures from all around the world, including adorable otters and a giant Pacific octopus.",
        whyDescription: "Watch tropical fish swim through a 90,000-gallon aquarium in the gigantic Caribbean Reef exhibition or pony up some extra cash to have a face-to-face encounter with a beluga whale.",
        address: "1200 S Lake Shore Dr, Chicago, IL 60605",
        coordinate: CLLocationCoordinate2D(latitude: 41.8676, longitude: -87.6140)
    ),
    Attraction(
        name: "Museum of Science and Industry",
        imageURL: "https://s1.citypass.net/img-afd2056/products/chicago/attractions/msi/gallery/msi-gallery-trains.jpg",
        whatDescription: "Interactivity is the name of the game at the Museum of Science and Industry, a Hyde Park institution that boasts a mirror maze, a simulated tornado and a WWII-era U-505 German on display.",
        whyDescription: "Step inside a building that dates back to the World’s Columbian Exposition of 1893 and explore exhibits that depict a Chicago street circa 1910 and a massive model railroad that depicts the 2,200-mile journey from Seattle to Chicago.",
        address: "5700 S Lake Shore Dr, Chicago, IL 60637",
        coordinate: CLLocationCoordinate2D(latitude: 41.7906, longitude: -87.5831)
    ),
    Attraction(
        name: "Adler Planetarium",
        imageURL: "https://c1.staticflickr.com/3/2065/2084602482_dd28f41674_b.jpg",
        whatDescription: "Visitors can explore astronomy and astrophysics at the Adler Planetarium, which sits at the outermost tip of Museum Campus (and offers some amazing views of the Chicago skyline).",
        whyDescription: "Learn about the history of U.S. space exploration and take peek inside the tiny Gemini 12 capsule (which took two astronauts to space and back) in the “Mission Moon” exhibition. Then head over to the museum’s Grainger Sky Theater, which uses multiple projectors to screen immersive films on a 70-foot-diameter dome.",
        address: "1300 S Lake Shore Dr, Chicago, IL 60605",
        coordinate: CLLocationCoordinate2D(latitude: 41.8663, longitude: -87.6068)
    ),
    Attraction(
        name: "National Museum of Mexican Art",
        imageURL: "https://c1.staticflickr.com/7/6158/6164964709_387c249dfe_b.jpg",
        whatDescription: "Located in the traditionally Hispanic neighborhood of Pilsen, this cultural institution hosts one of the country’s largest collection of Mexican art—and admission is always free.",
        whyDescription: "Inside the permanent “Nuestras Historias” exhibition, you’ll see work from famous artists like José de Páez and Miguel Cabrera as well modern pieces by Chicago-based talent such as muralist Hector Duarte and imagist Errol Ortiz.",
        address: "1852 W 19th St, Chicago, IL 60608",
        coordinate: CLLocationCoordinate2D(latitude: 41.8560, longitude: -87.6729)
    ),
    Attraction(
        name: "360 CHICAGO",
        imageURL: "https://c1.staticflickr.com/1/606/21229084910_4c529378de_b.jpg",
        whatDescription: "Sitting atop one of the tallest buildings on Michigan Avenue, this observatory places you 1,000 feet in the air, allowing visitors to see four different states on a clear day.",
        whyDescription: "Daredevils will want to test their mettle on 360 CHICAGO’s TILT attraction, which allows guests to lean over the side of the building and look down at the busy streets below them.",
        address: "875 N Michigan Avenue, 94th Floor, Chicago, IL 60611",
        coordinate: CLLocationCoordinate2D(latitude: 41.8989, longitude: -87.6232)
    ),
    Attraction(
        name: "Willis Tower Skydeck",
        imageURL: "https://c1.staticflickr.com/6/5498/11004243156_367f86c24b_b.jpg",
        whatDescription: "You can get high in Chicago in the Willis Tower’s Skydeck, which is located on the building’s 103rd floor—1,353 feet above the city.",
        whyDescription: "You’re essentially obligated to snap a selfie in the Skydeck’s Ledge—a glass box that hangs over the side of the building, giving you some breathtaking views of the urban expanse surrounding you (and beneath you).",
        address: "233 S Wacker Dr, Chicago, IL 60606",
        coordinate: CLLocationCoordinate2D(latitude: 41.8784, longitude: -87.6359)
    ),
    Attraction(
        name: "Chicago Cultural Center",
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/5/5d/Chicago_cultural_center.jpg",
        whatDescription: "Cultural events and the arts are the focus of this public building, which also happens to contain the world’s largest stained glass Tiffany dome.",
        whyDescription: "There’s always something happening in the Chicago Cultural Center, including free concerts in the Preston Bradley Hall and art exhibitions on the third floor. Best of all, you’ll never have to pay admission.",
        address: "78 E Washington St, Chicago, IL 60602",
        coordinate: CLLocationCoordinate2D(latitude: 41.884162, longitude: -87.624962)
    ),
    Attraction(
        name: "Music Box Theatre",
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/c/c8/The_Music_Box%2C_Chicago.jpg",
        whatDescription: "This beloved two-screen Lakeview movie house doesn’t usually show the latest blockbusters, but it does screen a curated selection of films in a vintage theater with clouds projected on its ceiling.",
        whyDescription: "Fans of arthouse, limited-release and 70mm films will love the Music Box’s lineup of screenings and midnight movies. Before (or after) the show, check out the adjacent lounge, where you can order a beer and munch on popcorn topped with real butter.",
        address: "3733 N Southport Ave, Chicago, IL 60613",
        coordinate: CLLocationCoordinate2D(latitude: 41.9499, longitude: -87.6638)
    ),
    Attraction(
        name: "Navy Pier",
        imageURL: "https://c1.staticflickr.com/5/4498/37726981696_d9deeccb35_b.jpg",
        whatDescription: "Tourists flock to this stretch of attractions, which juts out into the waters of Lake Michigan. Navy Pier is home to a 200-foot Ferris wheel, the city’s only real IMAX screen, Chicago Children's Museum, Chicago Shakespeare Theater and plentiful dining options.",
        whyDescription: "The sheer concentration of interesting things to do makes Navy Pier a great place for the whole family. You can see the city from a new perspective on the Ferris wheel, take in a show at the Chicago Shakespeare Theater, board a boat tour or kick back with a margarita on a patio.",
        address: "600 E Grand Ave, Chicago, IL 60611",
        coordinate: CLLocationCoordinate2D(latitude: 41.8916, longitude: -87.6053)
    ),
    Attraction(
        name: "The Green Mill",
        imageURL: "https://c1.staticflickr.com/8/7121/7593820346_c0898518e6_b.jpg",
        whatDescription: "This Uptown cocktail lounge is a fixture of Chicago’s live jazz scene and has been slinging drinks since before Prohibition (Al Capone and other gangsters used to hang out at the Green Mill).",
        whyDescription: "Once you’ve snapped a picture of the iconic Green Mill marquee, head inside, order a cocktail and take in a set from some of the city’s top jazz musicians. The music typically goes late, but you’ll need to show up early if you want to score a good seat.",
        address: "4802 N Broadway St, Chicago, IL 60640",
        coordinate: CLLocationCoordinate2D(latitude: 41.969209, longitude: -87.659904)
    ),
    Attraction(
        name: "Chicago History Museum",
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/2/24/Chicago_History.JPG",
        whatDescription: "Not so long ago this vibrant museum was the stodgy ol' Chicago Historical Society, which let you cull through thousands of archived photographs and curio. That library still exists, but joining it are several permanent and temporary exhibits, the largest of which is a treasure trove of historical objects, including a chunk of the original Fort Dearborn.",
        whyDescription: "This cultural institution shares age-old stories about the city and its inhabitants through exhibitions, programming and hands-on displays. If you want an in-depth look at the places and people that make Chicago what it is today, it's worth a visit.",
        address: "1601 N Clark St, Chicago, IL 60614",
        coordinate: CLLocationCoordinate2D(latitude: 41.9120, longitude: -87.6315)
    ),
    Attraction(
        name: "Humboldt Park",
        imageURL: "https://c1.staticflickr.com/9/8335/8094807951_db015ed964_b.jpg",
        whatDescription: "Filled with lagoons, pedestrian paths, wide-open fields and a boathouse, Humboldt Park is one of the biggest stretches of green space on Chicago’s West Side.",
        whyDescription: "Set in a predominantly Puerto Rican neighborhood, this park comes alive in the summer. You’ll find vendors selling mofongo (fried plantains are stuffed with meat), dogs running through the fields and people dining at the boathouse’s restaurant. Head to the south of the park to visit the National Museum of Puerto Rican Arts and Culture.",
        address: "1400 N Sacramento Ave Chicago, IL 60622",
        coordinate: CLLocationCoordinate2D(latitude: 41.9028, longitude: -87.7071)
    ),
    Attraction(
        name: "Buckingham Fountain",
        imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/6b/Buckingham_Fountain_in_Chicago%2C_USA.jpg",
        whatDescription: "Built in 1927 as a donation from the family, the Clarence Buckingham Memorial Fountain is one of the largest in the world. Designed in the period's iconic Art Deco style, the central fountain is surrounded by four seahorses that represent Lake Michigan's four bordering states.",
        whyDescription: "From 8am to 11pm, the fountain bursts to life hourly, shooting 15,000 gallons of water through nearly 200 nozzles each minute to create an impressive display. After dusk, the water show is accompanied by lights, a must-see if you are in the neighborhood in the evening.",
        address: "301 S Columbus Dr, Chicago, IL 60605",
        coordinate: CLLocationCoordinate2D(latitude: 41.8758, longitude: -87.6189)
    ),
    Attraction(
        name: "Magnificent Mile",
        imageURL: "https://c1.staticflickr.com/6/5517/11004435593_9dd2e51662_b.jpg",
        whatDescription: "Michigan Avenue is probably one of the most attractive boulevards in America. Michigan Avenue splits between North and South designations at Madison Street. This district is also known for its theaters, which host touring plays, musicals, and comedy acts.",
        whyDescription: "The city's famous Magnificent Mile is a section of Michigan Avenue north of the Chicago River, with numerous galleries, boutiques, and luxury shops. Some of the attractions along here include the John Hancock Center, the Wrigley Building, and the Tribune Tower.",
        address: "Magnificent Mile Chicago, IL 60611",
        coordinate: CLLocationCoordinate2D(latitude: 41.8948, longitude: -87.6242)
    )
]


//    var names: [String] = [
//        "Millennium Park",
//        "Art Institute of Chicago",
//        "Wrigley Field",
//        "Garfield Park Conservatory",
//        "Lincoln Park Zoo",
//        "The Second City",
//        "The Field Museum",
//        "Chicago Riverwalk",
//        "Museum of Contemporary Art",
//        "Shedd Aquarium",
//        "Museum of Science and Industry",
//        "Adler Planetarium",
//        "National Museum of Mexican Art",
//        "360 CHICAGO",
//        "Willis Tower Skydeck",
//        "Chicago Cultural Center",
//        "Music Box Theatre",
//        "Navy Pier",
//        "The Green Mill",
//        "Chicago History Museum",
//        "Humboldt Park",
//        "Buckingham Fountain",
//        "Magnificent Mile"
//
//]
//
//    var whatDescriptions: [String] = [
//        "This 24.5-acre section of Chicago’s front yard is one of the most popular places to spend time outdoors in the city, look at public art and attend special events.",
//        "One of the city’s most well-known cultural institutions, which houses more than 300,000 artworks and an on-site restaurant, Terzo Piano.",
//        "Built in 1914, Wrigley Field has been the home of North Side baseball team the Chicago Cubs for more than 100 years.",
//        "Among the largest conservatories in the United States, this giant greenhouse in Garfield Park provides a home for some 600 species of plants (most of which aren’t indigenous to the region).",
//        "Located in the middle of Lincoln Park, this 35-acre zoo houses more than 1,000 animals and is one of the few remaining free zoos in the country.",
//        "Bill Murray, Tina Fey, Stephen Colbert and Joan Rivers are just a few of the famous folks who honed their talents onstage at this theater devoted to sketch and improvised comedy.",
//        "Founded to house the biological and anthropological collections assembled for the World’s Columbian Exposition of 1893, this massive natural history museum has more dinosaur bones and ancient artifacts than any other institution in Chicago.",
//        "Hugging the banks of the main branch of the Chicago River, the Riverwalk provides a pedestrian path along the city’s most popular waterway, lined with restaurants, bars and gathering spaces.",
//        "Hosting one of the largest collections of contemporary art in the United States, this Chicago museum is a destination for cutting edge exhibitions and programming.",
//        "This Museum Campus staple is the home to thousands of aquatic creatures from all around the world, including adorable otters and a giant Pacific octopus.",
//        "Interactivity is the name of the game at the Museum of Science and Industry, a Hyde Park institution that boasts a mirror maze, a simulated tornado and a WWII-era U-505 German on display.",
//        "Visitors can explore astronomy and astrophysics at the Adler Planetarium, which sits at the outermost tip of Museum Campus (and offers some amazing views of the Chicago skyline).",
//        "Located in the traditionally Hispanic neighborhood of Pilsen, this cultural institution hosts one of the country’s largest collection of Mexican art—and admission is always free.",
//        "Sitting atop one of the tallest buildings on Michigan Avenue, this observatory places you 1,000 feet in the air, allowing visitors to see four different states on a clear day.",
//        "You can get high in Chicago in the Willis Tower’s Skydeck, which is located on the building’s 103rd floor—1,353 feet above the city.",
//        "Cultural events and the arts are the focus of this public building, which also happens to contain the world’s largest stained glass Tiffany dome.",
//        "This beloved two-screen Lakeview movie house doesn’t usually show the latest blockbusters, but it does screen a curated selection of films in a vintage theater with clouds projected on its ceiling.",
//        "Tourists flock to this stretch of attractions, which juts out into the waters of Lake Michigan. Navy Pier is home to a 200-foot Ferris wheel, the city’s only real IMAX screen, Chicago Children's Museum, Chicago Shakespeare Theater and plentiful dining options.",
//        "This Uptown cocktail lounge is a fixture of Chicago’s live jazz scene and has been slinging drinks since before Prohibition (Al Capone and other gangsters used to hang out at the Green Mill).",
//        "Not so long ago this vibrant museum was the stodgy ol' Chicago Historical Society, which let you cull through thousands of archived photographs and curio. That library still exists, but joining it are several permanent and temporary exhibits, the largest of which is Chicago: Crossroads of America, a treasure trove of historical objects, including a chunk of the original Fort Dearborn.", //supposed to be "" whoops
//        "Filled with lagoons, pedestrian paths, wide-open fields and a boathouse, Humboldt Park is one of the biggest stretches of green space on Chicago’s West Side.",
//        "Built in 1927 as a donation from the family, the Clarence Buckingham Memorial Fountain is one of the largest in the world. Designed in the period's iconic Art Deco style, the central fountain is surrounded by four seahorses that represent Lake Michigan's four bordering states. ",
//        "Michigan Avenue is probably one of the most attractive boulevards in America. Michigan Avenue splits between North and South designations at Madison Street. This district is also known for its theaters, which host touring plays, musicals, and comedy acts."
//
//]
//
//    var whyDescriptions: [String] = [
//        "Take a selfie in front of Cloud Gate (a.k.a. the Bean), go for a stroll through the serene Lurie Gardens, catch a free concert in the Frank Gehry-designed Jay Pritzker Pavilion (in the summer) or skate on the McCormick Tribune Ice Rink (in the winter).",
//        "Acquaint yourself with classic paintings like Georges Seurat’s A Sunday on La Grande Jatte (as seen in Ferris Bueller’s Day Off) and Grant Wood's American Gothic or explore an expansive collection of contemporary works in the museum’s Modern Wing.",
//        "Watch baseball at one of the oldest ballparks in America, sing along during the seventh-inning stretch and see one of the only manually operated scoreboards in existence, controlled by three members of the Cubs staff.",
//        "Stop by 365 days a year to admire the gigantic trees that fill the Palm Room, see a depiction of ancient Illinois vegetation in the Fern Room or window shop for succulents and cacti in the Desert Room.",
//        "Watch cute African penguins frolicking in Penguin Cove, observe majestic cats in the Kovler Lion House or visit the scaled residents of the McCormick Reptile House—all entirely free of charge.",
//        "You’ll see some of the most talented rising comedic talents (and maybe a couple future Saturday Night Live cast members) on the Second City’s Mainstage. If you want to learn more about improv, stand-up or sketch writing, you can sign up for a class at the Training Center.",
//        "Take a trip to the past by descending into a recreation of an ancient Egyptian tomb, explore a vast collection of taxidermy or stare at the sparkling stones in the Grainger Hall of Gems.",
//        "The waterside walkway allows you to see observe some of the city’s most gorgeous architecture from a new perspective. You can also sip a glass of merlot at City Winery or board a Water Taxi for a leisurely trip to Chinatown.",
//        "Take in a constantly changing lineup of exhibitions, including touring shows from the likes of Takashi Murakami and Kerry James Marshall, or stop by the museum’s in-house restaurant, Marisol, where chef Lula Cafe chef Jason Hammel serves an inventive menu.",
//        "Watch tropical fish swim through a 90,000-gallon aquarium in the gigantic Caribbean Reef exhibition or pony up some extra cash to have a face-to-face encounter with a beluga whale.",
//        "Step inside a building that dates back to the World’s Columbian Exposition of 1893 and explore exhibits that depict a Chicago street circa 1910 and a massive model railroad that depicts the 2,200-mile journey from Seattle to Chicago.",
//        "Learn about the history of U.S. space exploration and take peek inside the tiny Gemini 12 capsule (which took two astronauts to space and back) in the “Mission Moon” exhibition. Then head over to the museum’s Grainger Sky Theater, which uses multiple projectors to screen immersive films on a 70-foot-diameter dome.",
//        "Inside the permanent “Nuestras Historias” exhibition, you’ll see work from famous artists like José de Páez and Miguel Cabrera as well modern pieces by Chicago-based talent such as muralist Hector Duarte and imagist Errol Ortiz.",
//        "Daredevils will want to test their mettle on 360 CHICAGO’s TILT attraction, which allows guests to lean over the side of the building and look down at the busy streets below them.",
//        "You’re essentially obligated to snap a selfie in the Skydeck’s Ledge—a glass box that hangs over the side of the building, giving you some breathtaking views of the urban expanse surrounding you (and beneath you).",
//        "There’s always something happening in the Chicago Cultural Center, including free concerts in the Preston Bradley Hall and art exhibitions on the third floor. Best of all, you’ll never have to pay admission.",
//        "Fans of arthouse, limited-release and 70mm films will love the Music Box’s lineup of screenings and midnight movies. Before (or after) the show, check out the adjacent lounge, where you can order a beer and munch on popcorn topped with real butter.",
//        "The sheer concentration of interesting things to do makes Navy Pier a great place for the whole family. You can see the city from a new perspective on the Ferris wheel, take in a show at the Chicago Shakespeare Theater, board a boat tour or kick back with a margarita on a patio.",
//        "Once you’ve snapped a picture of the iconic Green Mill marquee, head inside, order a cocktail and take in a set from some of the city’s top jazz musicians. The music typically goes late, but you’ll need to show up early if you want to score a good seat.",
//        "This cultural institution shares age-old stories about the city and its inhabitants through exhibitions, programming and hands-on displays. If you want an in-depth look at the places and people that make Chicago what it is today, it's worth a visit.",
//        "Set in a predominantly Puerto Rican neighborhood, this park comes alive in the summer. You’ll find vendors selling mofongo (fried plantains are stuffed with meat), dogs running through the fields and people dining at the boathouse’s restaurant. Head to the south of the park to visit the National Museum of Puerto Rican Arts and Culture.",
//        "From 8am to 11pm, the fountain bursts to life hourly, shooting 15,000 gallons of water through nearly 200 nozzles each minute to create an impressive display. After dusk, the water show is accompanied by lights, a must-see if you are in the neighborhood in the evening. ",
//        "The city's famous Magnificent Mile is a section of Michigan Avenue north of the Chicago River, with numerous galleries, boutiques, and luxury shops. Some of the attractions along here include the John Hancock Center, the Wrigley Building, and the Tribune Tower."
//]
//
//    var coordinates: [CLLocationCoordinate2D] = [
//        CLLocationCoordinate2D(latitude: 41.8826, longitude: -87.6226),
//        CLLocationCoordinate2D(latitude: 41.8796, longitude: -87.6237),
//        CLLocationCoordinate2D(latitude: 41.9484, longitude: -87.6553),
//        CLLocationCoordinate2D(latitude: 41.8863, longitude: -87.7173),
//        CLLocationCoordinate2D(latitude: 41.9211, longitude: -87.6340),
//        CLLocationCoordinate2D(latitude: 41.9115, longitude: -87.6354),
//        CLLocationCoordinate2D(latitude: 41.8663, longitude: -87.6170),
//        CLLocationCoordinate2D(latitude: 41.8882, longitude: -87.6212),
//        CLLocationCoordinate2D(latitude: 41.8972, longitude: -87.6213),
//        CLLocationCoordinate2D(latitude: 41.8676, longitude: -87.6140),
//        CLLocationCoordinate2D(latitude: 41.7906, longitude: -87.5831),
//        CLLocationCoordinate2D(latitude: 41.8663, longitude: -87.6068),
//        CLLocationCoordinate2D(latitude: 41.8560, longitude: -87.6729),
//        CLLocationCoordinate2D(latitude: 41.8989, longitude: -87.6232),
//        CLLocationCoordinate2D(latitude: 41.8784, longitude: -87.6359),
//        CLLocationCoordinate2D(latitude: 41.884162, longitude: -87.624962),
//        CLLocationCoordinate2D(latitude: 41.9499, longitude: -87.6638),
//        CLLocationCoordinate2D(latitude: 41.8916, longitude: -87.6053),
//        CLLocationCoordinate2D(latitude: 41.969209, longitude: -87.659904),
//        CLLocationCoordinate2D(latitude: 41.9120, longitude: -87.6315),
//        CLLocationCoordinate2D(latitude: 41.9028, longitude: -87.7071),
//        CLLocationCoordinate2D(latitude: 41.8758, longitude: -87.6189),
//        CLLocationCoordinate2D(latitude: 41.8948, longitude: -87.6242)
//]
//












//    class func from(json: JSON) -> Attraction?
//    {
//        var title: String
//        if let unwrappedTitle = json["name"].string {
//            title = unwrappedTitle
//        } else {
//            title = ""
//        }
//
//        let locationName = json["location"]["address"].string
//        let lat = json["location"]["lat"].doubleValue
//        let long = json["location"]["lng"].doubleValue
//        let imageURL = ""
//        let coordinate = CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298)
//
//        return Attraction(name: locationName!, imageURL: imageURL, coordinate: coordinate)
//    }




//    //do i have to get rid of the "results"?
//
//    init(json: JSON) {
//        print(json)
//
//        self.name = json["name"].stringValue
//        self.imageURL = json["image_url"].stringValue
////        self.lat = json["coordinates"]["latitude"].doubleValue
////        self.long = json["coordinates"]["longitude"].doubleValue
//        //self.imageURL =  json[""].stringValue
//      //  self.description = json[].stringValue
//    }
//    
////    func mapItem() -> MKMapItem {
////
////    }
//
//}


//
//
//    var subtitle: String? {
//        return locationName
//    }
//
//    class func from(json: JSON) -> Venue?
//    {
//        var title: String
//        if let unwrappedTitle = json["name"].string {
//            title = unwrappedTitle
//        } else {
//            title = ""
//        }
//
//        let locationName = json["location"]["address"].string
//        let lat = json["location"]["lat"].doubleValue
//        let long = json["location"]["lng"].doubleValue
//        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
//
//        return Venue(title: title, locationName: locationName, coordinate: coordinate)
//    }
//
//    func mapItem() -> MKMapItem
//    {
//        let addressDictionary = [String(kABPersonAddressStreetKey) : subtitle]
//        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
//        let mapItem = MKMapItem(placemark: placemark)
//
//        mapItem.name = "\(title) \(subtitle)"
//
//        return mapItem
//    }
//}
//
//
