# frozen_string_literal: true


brooklyn = Category.create!({
  title: 'Brooklyn, NY',
  slug: 'brooklyn'
})
queens = Category.create!({
  title: 'Queens, NY',
  slug: 'queens'
})
nj = Category.create!({
  title: 'New Jersey',
  slug: 'new-jersey'
})

puts "seeded #{Category.count} categories"


red_hook = Storage.create!({
  category: brooklyn,

  title: 'Red Hook',
  slug: 'red-hook',
  phone: '718-509-6524',

  address: '183 Lorraine St.',
  area: 'Brooklyn, NY',
  zip_code: '11231',
  coordinates: [40.673591, -74.001568],
  place_id: 'ChIJ7TyQ8PNawokRf9vNpds593g',

  office_hours: [
    'Mon-Fri 8:00 am - 7:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],
  access_hours: [
    'Mon-Fri 8:00 am - 7:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],

  description_1: "
    <p>Red hook is one of the most desirable neighborhoods in Brooklyn, as it is a hub of continued revitalization and growth. What you will find in this area differs every couple of blocks as you have the parks, industrial businesses, expansive apartments and a sprinkling of quaint little homes. Notable landmarks for the area include the waterfront with breathtaking views of Manhattan, IKEA which has its very own ferry service, Fairway, and streets full of chic dining that attract visitors from all over the city. The best aspects about Red Hook are the residents, the budding artists and the determined entrepreneurs who bring this community of diverse people to life.</p>
    <p>Treasure Island Storage is proud to be the premier Self Storage facility serving the Red Hook community, our iconic state-of-the-art facility, provides residential and commercial storage. With 24-hour access and flexible month-to-month lease options available, we offer everything you’re looking for to meet your <b>storage needs</b> and even have a van to help get your belongings to the location.  If public transportation is a better option the G and F subway lines are a couple of blocks away, as well as the B61 and B54 buses across the street.</p>
    ",
  description_2: "
    <p>Treasure Island Storage Red Hook in Brooklyn, New York facility has a large assortment of storage units ranging in size from 4'x 4' to 10'x 30', all of which are climate controlled for your comfort and the protection of your property. We have outdoor accessible storage units, easy loading and parking spaces for vehicles. Recently, we've added space to accommodate large commercial and business units that can range from 500 to more than 6,000 square feet.</p>
    <p>Our storage experts are available all week using the chat feature on www.TIStorage.com, when visiting our site or via the telephone to help answer your questions about the rental process or any situations that might crop up.  We are happy to serve and look forward to seeing you soon.</p>
  ",

  directions: "
    <ol>
      <li>Take Steve Flanders Square toward Broadway/Canyon of Heroes</li>
      <li>Continue onto Murray Street</li>
      <li>Turn left onto West St</li>
      <li>Take the Battery Tunnel/Brooklyn ramp on the left to Interstate 278</li>
      <li>Continue onto I-478</li>
      <li>Keep left to stay on I-478</li>
      <li>Take exit 26 to merge onto Hamilton Ave</li>
      <li>Turn right onto Clinton St</li>
      <li>Turn left onto Bush St</li>
    </ol>
    Destination will be on the right
  ",

  features: [
    'Free Move-in Truck',
    'Household Storage',
    'Commercial Storage',
    'Boat Storage',
    'Car Storage',
    'Wine Storage',
    'U-Haul Rental',
    'Move Services',
    'PIN Number Access',
    'Climate Controlled Units',
    '24-Hour Video Surveillance',
    'Moving Boxes and other Moving and Packing Supplies',
    'Storage Managers',
    'Month-to- Month and Long-term Leases',
    'Move-in Specials',
    'Individually Alarmed Units',
    'Sizes from 5’x5’ to 10’x30’',
    'Convenient extended hours',
    'Ground Floor Loading',
    'Open Seven Days a Week',
    'Competitive Pricing and Unparalleled Service',
    'Drive-up Access'
  ],

  link_to_google: 'https://www.google.com/maps/place/Treasure+Island+Storage/@40.673247,-74.0036087,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0x78f739dba5cddb7f!8m2!3d40.673247!4d-74.00142',
  link_to_yelp: 'https://www.yelp.com/biz/treasure-island-storage-brooklyn'
})

ozone_park = Storage.create!({
  category: queens,

  title: 'Ozone Park',
  slug: 'ozone-park',
  phone: '718-395-2984',

  address: '78-02 Liberty Avenue',
  area: 'Ozone Park, NY',
  zip_code: '11417',
  coordinates: [40.67869, -73.858889],
  place_id: 'ChIJN0jyr-xdwokR89AC6EpsxYk',

  office_hours: [
    'Mon - Fri: 8:00 am - 8:00 pm',
    'Sat: 9:00 am - 5:00 pm',
    'Sun: 10:00 am - 4:00 pm'
  ],
  access_hours: [
    'Mon - Fri: 8:00 am - 8:00 pm',
    'Sat: 9:00 am - 5:00 pm',
    'Sun: 10:00 am - 4:00 pm'
  ],

  description_1: "
    <p>Having self-storage right in your neighborhood not only brings your belongings security and protection, but there is the added benefit of convenience. Treasure Island Storage Ozone Park, New York, is a new state-of-the-art self-storage facility with amenities and services to meet all of your household and commercial storage needs. We offer interior units and exterior drive up units:</p>

    <ul>
      <li>Climate-control</li>
      <li>A cutting-edge security system</li>
      <li>24/7 Access</li>
      <li>Free use of our van and additional moving services</li>
    </ul>
  ",
  description_2: "
    <p>Ozone Park is a residential community of locals that hail from the far corners of the globe. The diverse population brings a distinct flavor that is evident in the neighborhoods’ ambiance which is depicted in the businesses, homes and at community events. The people here are vested as they are proud to be homeowners and many of them are entrepreneurs following their passion in a place they love and Treasure Island Storage is proud to be part of it all.</p>
    <p>We realize that space and time are limited resources for a busy lifestyle, so to keep everything organized you need to store with Treasure Island Storage. Don’t run out of space, let our dedicated team is available 7-days a week help you clear out the clutter so you can get back to enjoying life and focus on making your free time as productive as possible. Getting to us is easy, you can take Atlantic Avenue, which is a main through-road in Brooklyn and Queens, Woodhaven Blvd or Rockaway Boulevard and bump into us by driving on Liberty Avenue. If you take public transportation, we are right next to the 80th Street station on the A line or the Q8 bus.</p>
    <p>Our staff of storage experts are available 7 days a week using the chat feature on www.TIStorage.com,  when visiting our site or via the phone to assist answer your questions about the rental process or any situations that might crop up.  We are happy to serve and look forward to seeing you soon.</p>
    <p>We hope to see you soon!</p>
  ",

  directions: "
    <ol>
      <li>Merge onto I-278 towards Belt Pkwy/Shore Pkwy</li>
      <li>Keep left at the fork to continue on Belt Pkwy/Shore Pkwy</li>
      <li>Take exit 17 for Cross Bay Blvd toward Woodhaven/Rockaways</li>
      <li>Merge onto Shore Pkwy</li>
      <li>Turn left onto Cross Bay Blvd</li>
      <li>Slight right onto the ramp to Conduit Blvd W</li>
      <li>Merge onto N Conduit Ave</li>
      <li>Keep right to stay on N Conduit Ave</li>
      <li>Turn right onto 78th St</li>
    </ol>
    Destination will be on the right
  ",

  features: [
    '24-Hour Security Monitoring',
    'Digital Surveillance System',
    'Business Center',
    'Climate-Controlled Units',
    'Heated & Cooled Spaces',
    'Friendly, Professional Staff',
    'Covered Loading / Unloading',
    'RV, Trailer & Boat Storage',
    'Outside Parking - Auto & RV',
    'Deliveries Accepted',
    'Dollies and Carts Available',
    'Drive-up Access',
    'Free Truck and Driver',
    'Fenced & Lighted',
    'Ground Level Units',
    'High Ceilings',
    'Major Credit Cards Accepted',
    'Military Discounts',
    'We Sell Boxes, Locks & Moving Supplies',
    'Student Discounts',
    'Tenant Insurance Available',
    'Senior Discounts',
    'Month-to- Month Rentals',
    'Online Bill Payment',
    'Electronic Gate Access'
  ],

  link_to_google: 'https://www.google.com/maps?cid=9927460022584004851',
  link_to_yelp: 'http://www.yelp.com/biz/treasure-island-storage-ozone-park'
})

jamaica = Storage.create!({
  category: queens,

  title: 'Jamaica',
  slug: 'jamaica',
  phone: '718-509-6543',

  address: '109-09 180th St.',
  area: 'Queens, NY',
  zip_code: '11433',
  coordinates: [40.700799, -73.774523],
  place_id: 'ChIJGbBVzz5hwokR1VMvwDUmb-k',

  office_hours: [
    'Mon-Fri 8:00 am - 7:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],
  access_hours: [
    'Mon-Fri 8:00 am - 7:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],

  description_1: "
    <p>Jamaica is the vibrant heart of Queens and is the gateway into reaching all points in Long Island. It is a dense residential locale that surrounds a plethora of shopping and dining options that have a strong Caribbean flare, but still attracts people from all walks of life. Anything you need you can get it in Jamaica, and anywhere you need to go it’s reachable as it’s a major transportation hub for the LIRR, subways E, F and J trains, as well as the MTA bus services Q42 and Q83.  A number of major roads intersect in Jamaica, meaning our Treasure Island Storage facility is conveniently accessible to you and our neighbors in Hillside, Hollis, St. Albans, and Richmond Hill.</p>
  ",
  description_2: "
    <p>New York living means there's no room for wasted time or misused space and that true for the people that live or do business in Jamaica. Our expert storage managers understand the demands of a hectic lifestyle, and are motivated to help you with your self-storage needs from start to finish. At Treasure Island Storage, we offer a variety of unit sizes to accommodate whatever it is you need to store, from old tax records, to vinyl records, and everything in between. Our unit sizes range from small closets to units up to 5,000 square feet. With the use of climate controlled units, 24-hour security systems, free move-in services, packing supplies, month-to-month leases, and so much more, you are assured a streamlined storage experience. We are fully prepared to help you move your items to a safe and secure storage environment.</p>
  ",

  directions: "
    <ol>
      <li>Take the FDR Drive toward I-495/E 34 St/Midtown Tun</li>
      <li>Take exit 8</li>
      <li>Merge onto FDR Drive/Fdr Drive Service Rd E</li>
      <li>Keep right to stay on FDR Drive/Fdr Drive Service Rd E</li>
      <li>Turn left onto E 35th St</li>
      <li>Turn right onto Tunnel Entrance St</li>
      <li>Turn right onto the ramp to I-495 E</li>
      <li>Continue onto I-495 E</li>
      <li>Continue onto Queens Midtown Tunnel</li>
      <li>Continue onto I-495 E/Queens Midtown Tunnel</li>
      <li>Keep left to stay on I-495 E</li>
      <li>Keep left to stay on I-495 E</li>
      <li>Take exit 22A-E toward Interstate 678/Grand Central Parkway/Van Wyck Expwy</li>
      <li>Keep right at the fork, follow signs for Grand Central Pkwy/Eastbound and merge onto Grand Central Pkwy</li>
      <li>Take exit 18 for Utopia Pkwy</li>
      <li>Merge onto Grand Central Pkwy</li>
      <li>Turn left to stay on Grand Central Pkwy</li>
      <li>Turn right at the 1st cross street onto Midland Pkwy</li>
      <li>Turn right onto Hillside Avenue</li>
      <li>Turn left onto 180th St</li>
      <li>Turn right at the 3rd cross street onto 93rd Ave</li>
      <li>Turn left onto 177th St</li>
      <li>Turn left at the 1st cross street onto Liberty Ave</li>
      <li>Turn right onto 180th St</li>
    </ol>
    Destination will be on the left
  ",

  features: [
    '24 Hour Security Monitoring',
    'Digital Surveillance System',
    'Business Center',
    'Climate Controlled Units',
    'Heated & Cooled Spaces',
    'Friendly, Professional Staff',
    'Covered Loading/Unloading',
    'RV, Trailer & Boat Storage',
    'Outside Parking - Auto & RV',
    'Deliveries Accepted',
    'Dollies and Carts Available',
    'Drive up Access',
    'Free Truck and Driver',
    'Fenced & Lighted',
    'Ground Level Units',
    'High Ceilings',
    'Major Credit Cards Accepted',
    'Military Discounts',
    'We Sell Boxes, Locks & Moving Supplies',
    'Student Discounts',
    'Tenant Insurance Available',
    'Senior Discounts',
    'Month to Month Rentals',
    'Online Bill Payment',
    'Electronic Gate Access'
  ],

  link_to_google: 'https://www.google.com/maps?cid=16820705145551541205',
  link_to_yelp: 'http://www.yelp.com/biz/treasure-island-self-storage-jamaica'
})

paterson = Storage.create!({
  category: nj,
  title: 'Paterson',
  slug: 'paterson',
  phone: '973-870-0454',

  address: '404 Grand Street',
  area: 'Paterson, NJ',
  zip_code: '07505',
  coordinates: [40.912536, -74.170175],
  place_id: 'ChIJo4TALTP8wokRQc_MSGrC5aw',

  office_hours: [
    'Mon-Fri 9:00 am - 8:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],
  access_hours: [
    'Mon-Fri 9:00 am - 8:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],

  description_1: "
    <p>Treasure Island Storage Paterson, New Jersey, offers units of varying sizes to accommodate your household and/or commercial needs in our updated self-storage facility. Our amenities and services are crafted to give our customers the best possible experience when visiting us along with ample space for your possessions and.<br>
      Our Paterson facility features:</p>
    <ul>
      <li>Climate-Control</li>
      <li>Advanced Security Surveillance</li>
      <li>24/7 Access Available</li>
    </ul>
  ",
  description_2: "
    <p>Getting to our facility in Paterson is easy, it’s located on Grand Street, directly across from the Passaic County Courthouse. Our friendly storage managers and staff have the expertise to guide you through the process, from packing your items, to renting a unit, moving your belongings, or showing you the proper way to lock your storage unit so that your belongings are always kept safe and secure.</p>
  ",

  directions: "<ol>
    <li>Take I-78 W/Holland Tunnel Towards NJ</li>
    <li>Keep <b>left</b> at the fork to continue on NJ-139 W</li>
    <li>Keep <b>left</b> to stay on NJ-139 W</li>
    <li>Take the US-1 N/US-9 N exit</li>
    <li>Keep right to continue toward US-1 N/U.S. 9 N/Tonnelle Ave</li>
    <li>Turn right onto US-1 N/U.S. 9 N/Tonnelle Ave</li>
    <li>Take the NJ-3 W exit on the <b>left</b> toward NJ-495 E/Clifton/Lincoln Tunnel</li>
    <li>Continue onto NJ-3 W</li>
    <li>Keep <b>left</b> at the fork and merge onto NJ-3 W</li>
    <li>Continue onto NJ-3 W</li>
    <li>Slight right onto the Garden State Pkwy N ramp</li>
    <li>Merge onto Garden State Pkwy</li>
    <li>Take exit 155 A on the <b>left</b> for NJ-19 toward I-80/Paterson</li>
    <li>Continue onto NJ-19 N</li>
    <li>Turn right onto Marshall St</li>
    <li>Turn <b>left</b> onto Grand St</li>
    <li>Turn right onto Prince St'</li>
  </ol>",

  features: [
    'Move-in Trucks',
    'Password Controlled Gates',
    'Climate Controlled Units',
    '24-Hour Video Surveillance',
    'Moving and Packing Supplies',
    'Month to Month Leases',
    'Move-in Specials',
    'Ground Floor Loading',
    'Open 7 Days a Week',
    'Great Prices and Great Service',
    'Referral Discount Program',
    'Senior and Military Discounts'
  ],

  link_to_google: 'https://www.google.com/maps?cid=12458577705934049089',
  link_to_yelp: 'http://www.yelp.com/biz/treasure-island-self-storage-paterson'
})

woodbridge = Storage.create!({
  category: nj,
  title: 'Woodbridge',
  slug: 'woodbridge',
  phone: '732-510-4010',

  address: '881 Saint George Ave',
  area: 'Woodbridge, NJ',
  zip_code: '07095',
  coordinates: [40.567496, -74.292012],
  place_id: 'ChIJgcP4oTe0w4kRRqg8c8bJdEY',

  office_hours: [
    'Mon-Fri 9:00 am - 8:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],
  access_hours: [
    'Mon-Fri 9:00 am - 8:00 pm',
    'Sat 9:00 am - 5:00 pm',
    'Sun 10:00 am - 4:00 pm'
  ],

  description_1: "
    <p>Woodbridge is our kind of town. It's a vibrant community of families and small businesses, with something to offer just about everyone, from a close proximity to the beautiful New Jersey shoreline, a Farmer's Market, and local performing arts scene. Being the oldest township in New Jersey, you can feel the history in the air as you pass the buildings on the streets. At Treasure Island Storage in Woodbridge, New Jersey, we've provided a new state-of-the-art self-storage facility with amenities and services to meet all of your household storage, commercial storage, and/or wine storage needs.</p>
    <ul>
      <li>Climate-Control</li>
      <li>State-of-the-Art Security System</li>
      <li>24/7 Access</li>
      <li>Free use of our van and additional moving services</li>
    </ul>
  ",
  description_2: "
    <p>Whether you run a retail business or restaurant, raise a family while working full time, or perhaps even all of the above, we know that you live a busy lifestyle and can require some extra help in keeping everything organized. There’s no reason to have to do the mental math of making sure your living room looks nice when there’s too much furniture of smaller items for the building to handle. When you find yourself running out of space, let our dedicated team help you in clearing out the clutter so that you can get back to enjoying life and focus on making your free time as productive as possible. Our managers are experts in the best storing practices, and can help guide you on what the best way to move and store your items are from your Woodbridge home to our storage facility. Whether it is how to pack your items, how to transport them, or what the best way to physically place the items into the storage unit is, the Treasure Island Storage team has your questions covered.</p>
    <p>Woodbridge, New Jersey has a large amount of activities available to its residents. Whether it is going shopping at the Brunswick Square Mall, playing at the Louis Brown Athletic Center, or taking the family out to the Keansburg Amusement Park, you should be able to enjoy what’s around you without having the safety of your items linger at the back of your head. Our state-of-the-art security system will keep your items as safe as they were kept in your own Woodbridge home, and our climate controlled storage units make sure that your more sensitive items affected by weather don’t get damaged by the changing seasons. If at any time you feel the need to check up on your stored items, our Woodbridge storage facility is a stone’s throw away, and you’ll have access to your items</p>
  ",

  directions: "<ol>
    <li>Take the I-95 toward Turnpike S</li>
      <li>Keep left to continue toward I-95 S</li>
      <li>Keep left at the fork and merge onto I-95 S</li>
      <li>Take exit 11 for U.S. 9 toward Woodbridge</li>
      <li>Keep left at the fork to continue toward King Georges Rd</li>
      <li>Keep right at the fork, follow signs for US-1 N/US-9 N/NJ-440 N/Woodbridge and merge onto King Georges Rd</li>
      <li>Continue onto NJ-184 E/W Pond Rd</li>
      <li>Turn right to merge onto U.S. 9 N</li>
      <li>Continue onto U.S. 9 N</li>
      <li>Slight right onto US-1 N/U.S. 9 N</li>
      <li>Take first right</li>
      <li>Take first right</li>
      <li>Take first left</li>
    </ol>
    Destination will be on the left
  ",

  features: [
    'Move-in Trucks',
    'Electronic Pass Code Key',
    'Senior and Military Discounts',
    'Climate Controlled Units',
    '24 Hour Video Surveillance',
    'Moving boxes &amp; Packing Supplies',
    'Month to Month leases',
    'Great move-in specials',
    'Ground Floor Loading',
    'Open 7 days a week',
    'Great Customer Service',
    'Drive Up Access',
    'Access 365 Days a Year',
    'Referral Discount Program'
  ],

  link_to_google: 'https://www.google.com/maps/place/Treasure+Island+Storage/@40.567541,-74.2942407,17z/data=!3m1!4b1!4m5!3m4!1s0x0:0x4674c9c6733ca846!8m2!3d40.567541!4d-74.292052',
  link_to_yelp: 'https://www.yelp.com/biz/treasure-island-self-storage-woodbridge'
})

puts "seeded #{Storage.count} storages"
