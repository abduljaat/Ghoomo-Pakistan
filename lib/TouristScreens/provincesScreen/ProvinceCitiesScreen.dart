import 'package:flutter/material.dart';
import 'package:ghoomo_pakistan/TouristScreens/provincesScreen/PunjabPlacesScreen.dart';
import 'package:ghoomo_pakistan/constants.dart';

class ProvinceCitiesScreen extends StatefulWidget {
  var name, number, city;
  var prov;
  ProvinceCitiesScreen(
      {required this.prov,
      required this.name,
      required this.number,
      required this.city});

  @override
  State<ProvinceCitiesScreen> createState() => _ProvinceCitiesScreenState();
}

class _ProvinceCitiesScreenState extends State<ProvinceCitiesScreen> {
  bool c1 = false;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  bool c5 = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    c1 = false;
    c2 = false;
    c3 = false;
    c4 = false;
    c5 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.prov.toUpperCase()}",
          style: TextStyle(
            fontFamily: "mainTextStyle",
          ),
        ),
        backgroundColor: green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          margin: EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              widget.prov == 'punjab'
                  ? Container(
                      padding: EdgeInsets.only(top: 10),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Lahore",
                                  style: TextStyle(
                                    fontFamily: "mainTextStyle",
                                  ),
                                ),
                                subtitle: c1
                                    ? Card(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                "Badshahi Mosque",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Badshahi Mosque',
                                                              city: 'Lahore',
                                                              lat: '31.5879664',
                                                              long:
                                                                  '74.3107136',
                                                              desc:
                                                                  'The Badshahi Mosque was built between 1671 and 1673 and by the Mughal emperor Aurangzeb. The mosque is an important example of Mughal architecture, with an exterior that is decorated with carved red sandstone with marble inlay. It remains the largest mosque of the Mughal-era, and is the third-largest mosque in Pakistan.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Lahore/Badshahi Mosque.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Lahore Fort",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Lahore Fort',
                                                              city: 'Lahore',
                                                              lat: '31.5881995',
                                                              long:
                                                                  '74.3154234',
                                                              desc:
                                                                  'The Lahore Fort Royal Fort is a citadel in the city of Lahore, Pakistan. The fortress is located at the northern end of walled city Lahore, and spreads over an area greater than 20 hectares. It contains 21 notable monuments, some of which date to the era of Emperor Akbar. The Lahore Fort is notable for having been almost entirely rebuilt in the 17th century, when the Mughal Empire was at the height of its splendour and opulence',
                                                              img:
                                                                  'assets/images/Places/Punjab/Lahore/Lahore Fort.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Lahore Museum",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Lahore Museum',
                                                              city: 'Lahore',
                                                              lat: '31.568387',
                                                              long:
                                                                  '74.3080969',
                                                              desc:
                                                                  'Lahore Museum’s majestic red-brick building blends the old tradition of Mughal architecture. It stands out among the structures built in Lahore during the British period (1849-1947). This building is home to the countrys largest and oldest collection of historical, cultural and artistic objects. Its collections of Gandhara sculpture, miniature paintings, rare manuscripts and old coins are known throughout the world. Its treasure of modern paintings, arts and crafts and ethnology are a national heritage beyond comparison. These collections attract research scholars, students and tourists from all over the world and constitute a unique cross-section of the cultural history of the Subcontinent. The Museum houses artifacts from many countries and regions such as Burma, Bhutan, Nepal, Tibet, Central Asia, the Middle East and Africa. Gandhara Art The Gandhara Gallery presents a number of friezes, panels and statues depicting the life story of the Buddha, from his previous incarnations, birth, youth, enlightenment, preaching of the law (Dharma) and death (Mahaparinirvana). Beyond these, along the other walls of the gallery, are the statues of the Buddha and the Bodhisattavas, panels and pieces showing foreign influence, architectural fragments, stucco and terra-cotta sculptures. Among the masterpieces are the famous Fasting Buddha, the Miracle of Saravasti (now usually identified as Sukhavati Heaven), a small Buddha head with traces of original gilding, and the standing figure of Athena. The friezes and other pieces of a reconstructed Stupa (in the centre of the gallery) are from Sikri near Jamal Garhi, District Mardan. In two display cases are displayed toilette trays, metal and stone objects, pottery and terra-cotta figurines, reliquaries and more, belonging to the Greek, Parthian, Scythian and Kushan periods. Placed next to them are a number of beautiful stucco heads from Rokhri in district Mianwali and terra-cotta heads from Akhnur in Jammu. The statue of Fasting Siddhartha ranks not only as one of the finest specimen of Gandhara Art but also as one of the rarest antiquities. This image shows an exceptional degree of Gandhara devices employed in the sculpture. This sculpture depicts in a very moving and immediately-felt manner the heroism of Buddha in his struggle to attain the answer to human suffering. Stucco Head of Buddha, From the collection of: Lahore Museum Seated Figure of Buddha, 240-300 AD., From the collection of: Lahore Museum This stele is traditionally believed to depict the scene of the Miracle of Sravasti. However, another opinion holds that it depicts Sukhavati -the paradise of the Buddha Amitayus. In the Miracle of Sravasti, the Buddha was challenged by six teachers of Rajagriha to participate in a contest of miracles before the King Prasenajit. The Buddha walked in air, flames leaping from his shoulders and water running from his feet. He then transformed himself into many images which floated in the air reaching up to heaven while he preached the Law. It is a rare example of the Gandhara School. The Lahore Museums Coin Collection The Coin Collection, with 40,000 pieces, is one of the largest in the Subcontinent. It includes the earliest examples of punch-marked coins issued in the seventh/sixth century BC during the time of the Achaemenian Empire. This collection represents almost all the ruling families of the region like Graeco-Bactrian, Indo-Greek, Mauryan, Indo-Parthian, Kushan, Indo-Scythian, Huns, Hindu Shahia, Arabs, Ghaznavids, the Sultans, the Mughals, the Durranis, the Sikhs, the British and the modern coins of Pakistan. This collection attracts the attention of scholars from all over the world for its rarity and richness. Gold Coin of Jahangir with Zodiacal Sign (Sagittarius), 1605-1628 A.D, Mughal Emperor Jahangir, 1605/1628, From the collection of: Lahore Museum Besides, some examples of coins belonging to the Umayyads, Abbasids and of various other Muslim rulers of Central Asia, Africa and different states of the Subcontinent are also a part of this collection. The collection includes the first coins issued by Mahmood of Ghazna at Lahore bearing the legend of Mahmoodpur, the new name given by Mahmood to Lahore, and the beautiful Zodiac coins issued by the Emperor Jahangir. As a whole, the coin collection of the Museum is an invaluable treasure for the study of the political, economic, social and cultural history of the subcontinent in chronological order as well as for the study of the development of coin-making technology. Indus Valley Civilization Collection The Indus Valley Civilization Gallery represents various stages of pre and proto history. The objects include Stone Age tools from Soan Valley - among the earliest objects produced by humans. The oldest in the gallery is from 500,000 years ago. The beginnings of civilization are represented by objects from Mehrgarh, a Neolithic period site in Balochistan famous for its continuous occupation by humans from 7000 to 2500 BC. The rest of the gallery exhibits objects from two large Indus Valley sites - Harappa and Mohenjodaro (3500 – 1500 BC), first excavated in 1920 by teams led by British archaeologists. The objects include: wheel-turned pottery, jewellery of terracotta, paste and semi-precious beads, measuring weights, toys, gaming objects, various other items of daily use made of clay and bronze, and bronze arrow heads and implements. Terracotta Dice (Indus Civilization), -2600/-1900, From the collection of: Lahore Museum Terracotta Lion Figurine (Harappan Civilization), -2600/-1900, From the collection of: Lahore Museum The Collection of Miniatures The Lahore Museum  has one of the largest and most representative collection of miniature paintings in the Subcontinent. The collection was built in the early part of the 20th Century. It includes over a thousand paintings, ranging from early 16th Century to the 20th Century. These include leaves of Jaina manuscripts; significant examples of Persian, Imperial Mughal, Provincial Mughal and Bazar Mughal paintings; Rajput  miniatures from Rajasthan, and miniatures from the Punjab hill states, such as Guler, Basohli, Kangra, and Nur(pur). Specimens of Sikh portraiture and miniatures on ivory are also  interesting parts of this collection. Shahab Uddin Ghauri, From the collection of: Lahore Museum Hindu, Buddhist and Jaina Collections These have four sections - Nepalese, Tibetan, Burmese and Subcontinent. Most objects belong to the late 19th and early 20th century, however, a few pieces date back to 8th-10th centuries. The Hindu art collection in the Museum contains a good number of sculptures, images, statues and other objects made of stone, marble, wood, ivory and other materials. Various architectural pieces depicting outstanding artistic achievement are also part of the collection. Some of the highlights of the collection include a large lingam with the head of Shiva discovered from a site near Jhelum, a beautifully carved figure of Vishnu, a stone piece with sculpted figures of Shiv and Parvati dating from 7-8th Century found from a site in Lahore, and a large sculpted architectural piece depicting Durga as Mahishasuramardini (slayer of the buffalo demon).There are several architectural pieces from ‘Murti’ a Jaina temple in Salt Range in this collection. The gallery has a collection from Nepal - wood carvings, painted tankas, papiermache objects, metal work, jewelry, statues of gilded bronze predominantly representing the Tantric cult. These objects date from the sixteenth to the twentieth centuries. Tibetan art in this gallery’s collection comprises of sculptures, paintings and jewelry while the Burmese contains mainly lacquer work objects, and wooden craft and a beautiful gilded Buddha sitting on a throne under three umbrellas. The Manuscripts Collection Approached through a magnificent carved wood doorway from Jhang, the Manuscripts Gallery has sections comprising Quranic, Persian and miscellaneous manuscripts such as of Hadeeth, history, geography, encyclopaedia, guides, biography and literature. Quranic manuscripts are in Kufic, Magharabi, Naskh and Bahar styles of Arabic scripts. Most of the manuscripts have been scribed either in Naskh and Nasta’aleeq or some variants of the two. Manuscripts are illuminated, decorated and illustrated. Calligraphy Print, Tughra Script, 20th Century A.D. Contemporary Art The Museum has a unique collection of modern Pakistani paintings by well-known artists of the country and a number of Bengal School paintings. It also has the only ceiling mural ever made in Pakistan, by Syed Sadequain Ahmed Naqvi. Comprising of 44 panels, each 8, this mural spans 9, and symbolizes Pakistan cultural and artistic heritage. The Collection of Islamic Art The advent of Islam in the beginning of 8th century from the South and 11th century from the North ushered in a distinct era for the arts and crafts of the subcontinent, a selection of which is presented in the Museums Islamic Arts Gallery. The Sura Yasin from the Holy Quran has been calligraphed by the famous artist Sadequain all along the top of showcases in this gallery and runs over a length of 269 feet. White Glaze Flower Vase, From the collection of: Lahore Museum The Freedom Movement Gallery The Freedom Movement Gallery narrates, with the help of paintings, photographs and newspaper cuttings, the story of the struggles for freedom, from 1757 to the creation of Pakistan in 1947. Arms and Armour Collection The Arms and Armaments gallery presents an array of Hindu, Muslim, Sikh and early British period arms and armoury. It features arrows, Khandas (the straight bladed daggers of the Rajputs), sacrificial dahs (sword), elephant goads and more. Weapons from the Muslim period include spears, curved swords with steel blades soaked in black crystal water with plain and engraved hilts, inlaid and enameled shields, mail coats and helmets, breast plates, and arm and leg-guards. Sikh period weapons include knives, daggers, spears and lances. At one end of the Gallery is a gun barrel, mounted on wooden pedestal, belonging to a Sikh, Sardar Fateh Singh and dated Samvat 1855 Bikrami / 1798 A.D. It was found in a village near Pattoki, Punjab. During the British period, a shift in the weaponry of the region took place, with the introduction of match-lock and flint-lock pistols, and guns and cannons. The Stamp Collection Even before Independence, the question of introducing Pakistan postage stamps on the day of the birth of Pakistan (14th August, 1947) was examined. Due to complications accompanying the designing and printing of new postage stamps and the limited period then available, it was decided that the postage stamps and postal stationary to be used by the Government of Pakistan should, in the first instance, be distinguished by printing the word “Pakistan” over Indian postage stamps and stationery. The printers considered even this to be a  rather huge task; hence it was decided to introduce Indian postage stamps and stationery with “Pakistan” over them with effect from 1st October, 1947. These were printed by the Government of India Security Press in Nashik, and later by the Government presses in Pakistan. These over-printed Indian Postage Stamps became very popular with philatelists over the world, as rubber stamping or hand stamping is never allowed, hence postage stamps bearing rubber over-prints are considered unauthorized. Credits: Story Curator: Sumaira Samad, Lahore Museum Curatorial assistance Waqas Ahmad and Tariq Mehmood, Lahore Museum Credits: All media The story featured may in some cases have been created by an independent third party and may not always represent the views of the institutions, listed below, who have supplied the content. Lahore Museum Lahore Museum Stories from Lahore Museum ONLINE EXHIBIT The Gandhara Gallery Lahore Museum ONLINE EXHIBIT Contemporary Paintings Gallery Lahore Museum ONLINE EXHIBIT Coins Gallery Lahore Museum Explore more RELATED THEME Wonders of Pakistan A showcase of Pakistans finest cultural treasures. From ancient monuments to contemporary art, be inspired by the wonders of this incredible country.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Lahore/Lahore Museum.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Masjid Wazir Khan",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Masjid Wazir Khan',
                                                              city: 'Lahore',
                                                              lat: '31.5832802',
                                                              long:
                                                                  '74.3236145',
                                                              desc:
                                                                  'Lahore is one of the oldest cities in Pakistan and is renowned for its cultural wealth. The city has preserved several mosques, offices, and libraries from the Mughal and colonial eras. Most of these structures are still functional today. This includes the Wazir Khan Mosque,  the most ornate mosque from the Mughal era. Even today, it serves as a major site of worship. It stands outside the Delhi gate of Lahore’s walled city, which visitors can reach after passing through the bustling bazaar and squabbling voices of vendors and customers.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Lahore/Masjid Wazir Khan.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Shalimar Bagh",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Shalimar Bagh',
                                                              city: 'Lahore',
                                                              lat: '31.5843201',
                                                              long:
                                                                  '74.3827802',
                                                              desc:
                                                                  'The Shalimar Gardens were laid out as a Persian paradise garden intended to create a representation of an earthly utopia in which humans co-exist in perfect harmony with all elements of nature',
                                                              img:
                                                                  'assets/images/Places/Punjab/Lahore/Shalimar Bagh.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : null,
                                onTap: () {
                                  c1 = !c1;
                                  setState(() {});
                                },
                              )),
                          Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Faisalabad",
                                  style: TextStyle(
                                    fontFamily: "mainTextStyle",
                                  ),
                                ),
                                subtitle: c2
                                    ? Card(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                "Clock Tower",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Clock Tower',
                                                              city:
                                                                  'Faisalabad',
                                                              lat: '31.4189596',
                                                              long:
                                                                  '73.0791095',
                                                              desc:
                                                                  'The Faisalabad Clock Tower formerly known as the Lyallpur Clock Tower is a clock tower in Faisalabad, Punjab, Pakistan, and is one of the oldest monuments still standing in its original state from the period of the British Raj. It was built in 1905 by the British, when they ruled much of the South Asia during the nineteenth century.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Faisalabad/Clock Tower.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Gatwala Forest Park",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Gatwala Forest Park',
                                                              city:
                                                                  'Faisalabad',
                                                              lat: '31.4738676',
                                                              long:
                                                                  '73.1405327',
                                                              desc:
                                                                  "The park is situated 17 km of Faisalabad along Faisalabad-Sheikhupura Road and 120 Km from Lahore. The park consists 131 acres is Reserved Forest and being managed for recreational purposes. The park was established during 1984-85 to 1991-92 at a total cost of Rs.15.676 million under a development project . This park is a combination of cultural, educational and amusement facilities.",
                                                              img:
                                                                  'assets/images/Places/Punjab/Faisalabad/Gatwala Forest Park.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Lyallpur Museum",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Lyallpur Museum',
                                                              city:
                                                                  'Faisalabad',
                                                              lat: '31.4218239',
                                                              long:
                                                                  '73.0836494',
                                                              desc:
                                                                  'Lyallpur Museum is a heritage museum in Faisalabad, Pakistan ( the old and original name for the city of Faisalabad is Lyallpur).It has 10 galleries which show the ancient and modern history and culture of Lyallpur/Faisalabad.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Faisalabad/Lyallpur Museum.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Gumti Fountain",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Gumti Fountain',
                                                              city:
                                                                  'Faisalabad',
                                                              lat: '31.4190233',
                                                              long:
                                                                  '73.0843599',
                                                              desc:
                                                                  'The Gumti Water Fountain is a monument in Faisalabad, Pakistan preserved from the British Raj era. It was built during the early nineteenth century and was a general meeting place of the city folk for local town meetings.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Faisalabad/Gumti Fountain.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Jinnah Garden",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number: widget
                                                                  .number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Jinnah Garden',
                                                              city:
                                                                  'Faisalabad',
                                                              lat: '31.4258264',
                                                              long:
                                                                  '73.0851178',
                                                              desc:
                                                                  'Spacious, landscaped outdoor space with a playground & paved walkways, plus a historic monument.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Faisalabad/Jinnah Garden.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : null,
                                onTap: () {
                                  c2 = !c2;
                                  setState(() {});
                                },
                              )),
                          Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Bahawalpur",
                                  style: TextStyle(
                                    fontFamily: "mainTextStyle",
                                  ),
                                ),
                                subtitle: c3
                                    ? Card(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                "Jinnah Garden",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number: widget
                                                                  .number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Jinnah Garden',
                                                              city:
                                                                  'Bahawalpur',
                                                              lat: '31.4258264',
                                                              long:
                                                                  '73.0851178',
                                                              desc:
                                                                  'Spacious, landscaped outdoor space with a playground & paved walkways, plus a historic monument.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Faisalabad/Jinnah Garden.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Bahawalpur Museum",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Bahawalpur Museum',
                                                              city:
                                                                  'Bahawalpur',
                                                              lat: '29.3898568',
                                                              long:
                                                                  '71.6853498',
                                                              desc:
                                                                  'The Bahawalpur Museum established in 1976, is a museum of archaeology, art, heritage, modern history and religion located in Bahawalpur, Punjab, Pakistan',
                                                              img:
                                                                  'assets/images/Places/Punjab/Bahawalpur/Bahawalpur Museum.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bus',
                                                              veh3:
                                                                  'MotorBike'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Darbar Mahal",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Darbar Mahal',
                                                              city:
                                                                  'Bahawalpur',
                                                              lat: '29.3970192',
                                                              long:
                                                                  '71.6996904',
                                                              desc:
                                                                  'Darbar Mahal is a palace in the city of Bahawalpur, Pakistan.he building was built to hold courtly events and government offices of the former princely state of Bahawalpur.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Bahawalpur/Darbar Mahal.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Bus'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Derawar (Desert) Forts",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Derawar (Desert) Forts',
                                                              city:
                                                                  'Bahawalpur',
                                                              lat: '28.7680083',
                                                              long:
                                                                  '71.3343583',
                                                              desc:
                                                                  'Derawar Fort is a fortress in Ahmadpur East Tehsil of Bahawalpur District in the Punjab province of Pakistan. Approximately 20 km south of the city of Ahmedpur East, the forty bastions of Derawar are visible for many miles in the Cholistan Desert. The walls have a perimeter of 1500 metres and stand up to thirty metres high',
                                                              img:
                                                                  'assets/images/Places/Punjab/Bahawalpur/Derawar (Desert) Forts.jpg',
                                                              veh1: '4x4 Jeeps',
                                                              veh2: 'Bikes',
                                                              veh3:
                                                                  'High vehicle'),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Gulzar Mahal",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Gulzar Mahal',
                                                              city:
                                                                  'Bahawalpur',
                                                              lat: '29.3947429',
                                                              long:
                                                                  '71.6974619',
                                                              desc:
                                                                  'Gulzar Mahal was built between 1906 and 1909.It was commissioned during the reign of Sadeq Mohammad Khan and was built to be the residence for women members of the royal household of the former princely state of Bahawalpur, aside from the Queen.',
                                                              img:
                                                                  'assets/images/Places/Punjab/Bahawalpur/Gulzar Mahal.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Bus'),
                                                    ));
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : null,
                                onTap: () {
                                  c3 = !c3;
                                  setState(() {});
                                },
                              )),
                          Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Sheikhupura",
                                  style: TextStyle(
                                    fontFamily: "mainTextStyle",
                                  ),
                                ),
                                subtitle: c4
                                    ? Card(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                "Hiran Minar",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                        number: widget.number,
                                                        name: widget.name,
                                                        userCityy: widget.city,
                                                        place: 'Hiran Minar',
                                                        city: 'Sheikhupura',
                                                        lat: '31.743108',
                                                        long: '73.9552832',
                                                        desc: 'Hiran Minar is an early 16th-century Mughal era complex located in Sheikhupura, in the Pakistani province of Punjab. The complex was built at the site of a game reserve in honour of Mughal Emperor Jahangir beloved antelope named Mansraj.',
                                                        img: 'assets/images/Places/Punjab/Sheikhupura/Hiran Minar.jpg',
                                                        veh1: 'Car',
                                                        veh2: 'Bike',
                                                        veh3: 'Van',
                                                      ),
                                                    ));
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : null,
                                onTap: () {
                                  c4 = !c4;
                                  setState(() {});
                                },
                              )),
                          Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: ListTile(
                                trailing: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Jhelum",
                                  style: TextStyle(
                                    fontFamily: "mainTextStyle",
                                  ),
                                ),
                                subtitle: c5
                                    ? Card(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(
                                                "Mangla Dam",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                        number: widget.number,
                                                        name: widget.name,
                                                        userCityy: widget.city,
                                                        place: 'Mangla Dam',
                                                        city: 'Jhelum',
                                                        lat: '33.1406353',
                                                        long: '73.6425831',
                                                        desc: 'The Mangla Dam is a multipurpose dam situated on the Jhelum River in the Mirpur District of Azad Kashmir, Pakistan. It is the sixth-largest dam in the world. The village of Mangla, which sits at the mouth of the dam, serves as its namesake.',
                                                        img: 'assets/images/Places/Punjab/Jhelum/Mangla Dam.jpg',
                                                        veh1: 'Car',
                                                        veh2: 'Bike',
                                                        veh3: 'Van',
                                                      ),
                                                    ));
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                "Qila Rohtas Fort",
                                                style: TextStyle(
                                                  fontFamily: "mainTextStyle",
                                                ),
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PunjabPlacesScreen(
                                                        number: widget.number,
                                                        name: widget.name,
                                                        userCityy: widget.city,
                                                        place: 'Qila Rohtas Fort',
                                                        city: 'Jhelum',
                                                        lat: '32.9645032',
                                                        long: '73.5744779',
                                                        desc: 'Rohtas Fort is a 16th-century fortress located near the city of Dina in Jhelum district of the Punjab province of Pakistan. Raja Todar Mal, the minister of the king Sher Shah Suri, supervised the construction of the fort, which is now one of the largest and most formidable in Punjab',
                                                        img: 'assets/images/Places/Punjab/Jhelum/Qila Rohtas Fort.jpg',
                                                        veh1: 'Car',
                                                        veh2: 'Bike',
                                                        veh3: 'Van',
                                                      ),
                                                    ));
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    : null,
                                onTap: () {
                                  c5 = !c5;
                                  setState(() {});
                                },
                              )),
                        ],
                      ),
                    )
                  : widget.prov == 'sindh'
                      ? Container(
                          padding: EdgeInsets.only(top: 10),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                    trailing: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      "Karachi",
                                      style: TextStyle(
                                        fontFamily: "mainTextStyle",
                                      ),
                                    ),
                                    subtitle: c1
                                        ? Card(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Text(
                                                    "Clifton Beach",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Clifton Beach',
                                                              city: 'Karachi',
                                                              lat: '24.7941602',
                                                              long:
                                                                  '67.0315041',
                                                              desc:
                                                                  'Karachi is the most prominent coastal city of Pakistan and beach lovers here have many opportunities to visit different beaches bordering the Arabian Sea. Clifton Beach is purported to give the best value in leisure and recreational opportunities for fun seekers and beach lovers.',
                                                              img:
                                                                  'assets/images/Places/Sindh/Karachi/Clifton Beach.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Mazar-e-Quaid",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Mazar-e-Quaid',
                                                              city: 'Karachi',
                                                              lat: '24.8746236',
                                                              long:
                                                                  '67.0395471',
                                                              desc:
                                                                  'Mazar-e-Quaid also known as Jinnah Mausoleum or the National Mausoleum, is the final resting place of Muhammad Ali Jinnah, the founder of Pakistan. Designed in a 1960s modernist style, it was completed in 1971, and is an iconic symbol of Karachi as well as one of the most popular tourist sites in the city.',
                                                              img:
                                                                  'assets/images/Places/Sindh/Karachi/Mazar-e-Quaid.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Mohatta Palace",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Mohatta Palace',
                                                                  city:
                                                                      'Karachi',
                                                                  lat:
                                                                      '24.814321',
                                                                  long:
                                                                      '67.0326807',
                                                                  desc:
                                                                      'The Mohatta Palace is a museum located in Karachi, Sindh, Pakistan. Designed by Muhammad komail Hussain, the palace was built in 1927 in the posh seaside locale of Clifton as the summer home of Shivratan Mohatta, a Hindu Marwari businessman from what is now the modern-day Indian state of Rajasthan. The palace was built in the tradition of stone palaces of Rajasthan, using pink Jodhpur stone in combination with the local yellow stone from nearby Gizri. Mohatta could enjoy this building for only about two decades before the partition of India, after which he left Karachi for the new state of India.',
                                                                  img:
                                                                      'assets/images/Places/Sindh/Karachi/Mohatta Palace.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Port Grand",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Port Grand',
                                                                  city:
                                                                      'Karachi',
                                                                  lat:
                                                                      '24.8449857',
                                                                  long:
                                                                      '66.9909885',
                                                                  desc:
                                                                      'Port Grand Food and drink and Entertainment Complex is a recreational area built in Karachi, Sindh, Pakistan along the waterfront of the 19th century Native Jetty Bridge that connects the Karachi Port Trust to Keamari. The project was a result of joint efforts made by the Karachi Port Trust and a private company Grand Leisure Corporation.  The complex was opened for public on 28 May 2011, with then Governor of Sindh, Ishratul Ibad inaugurating the complex. The complex is a hub of shopping, dining, cultural and coastal recreational activities in the city.',
                                                                  img:
                                                                      'assets/images/Places/Sindh/Karachi/Port Grand.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Frere Hall",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Frere Hall',
                                                                  city:
                                                                      'Karachi',
                                                                  lat:
                                                                      '24.8475152',
                                                                  long:
                                                                      '67.0330418',
                                                                  desc:
                                                                      'Frere Hall is a building in Karachi, Pakistan that dates from the early British colonial era in Sindh. Completed in 1865, Frere Hall was originally intended to serve as Karachis town hall, and now serves as an exhibition space and library. Frere Hall is located in central Karach colonial-era Saddar Town, in the Civil Lines neighborhood that is home to several consulates. The hall is located between Abdullah Haroon Road and Fatima Jinnah Road. It lies adjacent to the colonial-era Sind Club.',
                                                                  img:
                                                                      'assets/images/Places/Sindh/Karachi/Frere Hall.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        : null,
                                    onTap: () {
                                      c1 = !c1;
                                      setState(() {});
                                    },
                                  )),
                              Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                    trailing: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      "Hyderabad",
                                      style: TextStyle(
                                        fontFamily: "mainTextStyle",
                                      ),
                                    ),
                                    subtitle: c2
                                        ? Card(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Text(
                                                    "Sindh Museum",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Sindh Museum',
                                                              city: 'Hyderabad',
                                                              lat: '25.3848137',
                                                              long: '68.267911',
                                                              desc:
                                                                  'The Sindh Museum is a museum located in Hyderabad, Sindh, Pakistan. The museum was established in 1971to collect, preserve, study, and exhibit the records of the cultural history of Sindh. It also sometimes hosts cultural fairs. The museum features the history and heritage of the Sindh and the Indus Valley civilization. Items from various ruling periods of Sindh, including Samma, Soomra, Kalhora, and Talpur periods can be viewed by the visitors. The museum also showcases the past and present village lifestyle of Sindh',
                                                              img:
                                                                  'assets/images/Places/Sindh/Hyderabad/Sindh Museum.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Miran Ja Quba (Tombs of Mirs)",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Miran Ja Quba (Tombs of Mirs)',
                                                              city: 'Hyderabad',
                                                              lat: '25.4045468',
                                                              long:
                                                                  '63.4879906',
                                                              desc:
                                                                  'The Miran Ja Quba (Tombs of Mirs) also known as Tombs of Talpur Mirs are a complex of tombs of the ruling Talpur Mirs of Sindh who reigned from 1784 to 1843. The tombs are also known as Cubbas. These tombs are located in Hirabad, Hyderabad in the Sindh province of Pakistan. The tombs complex hosts large mausoleums for Talpur rulers while they are several smaller mausoleums for their wives, consorts and infant children. There are several graves in the external area that are uncovered and unmarked, apart from a few exceptions. The graves are mostly made out of marble and usually have Quranic verses inscribed on their surfaces. Once a magnificent burial ground for the Talpur rulers, this place now has several preservation concerns. As of 30 March 2011, the Culture Department, Government of Sindh retained the charge for these monuments, following a devolution of the government to provinces.  Since then, there has been slow and steady restoration work on preserving these monuments',
                                                              img:
                                                                  'assets/images/Places/Sindh/Hyderabad/Miran Ja Quba (Tombs of Mirs).jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Mukhi House",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Mukhi House',
                                                              city: 'Hyderabad',
                                                              lat: '28.4765117',
                                                              long:
                                                                  '66.8249137',
                                                              desc:
                                                                  'The Mukhi House also known as Mukhi Mahal is a museum located in Hyderabad, Sindh, Pakistan. For a brief period, it housed a government school named Khadija Girls School. Built in 1920 by Jethanand Mukhi, the Mukhi House in Hyderabad served as a family residence until the partition of India compelled the family to vacate by 1957. Following the partition of India, the property stewardship transitioned several times, including possession by the Evacuee Trust Property Board and various government bodies. The property endured further harm due to misuse and civil disturbances. The Sindh Antiquities Department initiated restoration work in 2009, with the Mukhi family endorsing the property conversion into a public museum.',
                                                              img:
                                                                  'assets/images/Places/Sindh/Hyderabad/Mukhi House.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        : null,
                                    onTap: () {
                                      c2 = !c2;
                                      setState(() {});
                                    },
                                  )),
                              Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                    trailing: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      "Sukkur",
                                      style: TextStyle(
                                        fontFamily: "mainTextStyle",
                                      ),
                                    ),
                                    subtitle: c3
                                        ? Card(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Text(
                                                    "Sadhu Belo",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Sadhu Belo',
                                                                  city:
                                                                      'Sukkur',
                                                                  lat:
                                                                      '27.6936618',
                                                                  long:
                                                                      '68.8681349',
                                                                  desc:
                                                                      'Sadh Belo also spelt as Sadh Bela, is an island in the Indus River near Sukkur, Sindh, Pakistan that is famous for its highly revered Hindu temples. The temples are associated with the syncretic Udasi movement of Sikhism. The island is famous for Teerath Asthan which is the biggest Hindu temple in Pakistan. The complex has eight other temples, a library, dining areas, a huge garden, along with rooms and residences for monks and people who want to stay on the island on a spiritual retreat',
                                                                  img:
                                                                      'assets/images/Places/Sindh/Sukkur/Sadhu Belo.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Arore",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Arore',
                                                                  city:
                                                                      'Sukkur',
                                                                  lat:
                                                                      '27.5746515',
                                                                  long:
                                                                      '69.0023237',
                                                                  desc:
                                                                      'Arore is the ancestral town of the Arora Community. In 711, Aror was captured by the army of Muslim general Muhammad bin Qasim. Arab historians recorded the city name as Al-rur, Al-ruhr and Al Ror. In 962 it was hit by a massive earthquake that changed the course of the Indus River and ruined the town mud brick building, thereby setting into play the city decline, and eventual re-settlement at Rohri,  along the modern-day shores of the Indus. Most of Arore ruins have been lost, though some arches of a mosque built shortly after the 8th century Arab invasion remain standing. The Kalka Cave Temple, a Hindu temple dedicated to Kalkaan Devi, still exists near the ruins, and is still used',
                                                                  img:
                                                                      'assets/images/Places/Sindh/Sukkur/Arore.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Tomb of Seven Sisters",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Tomb of Seven Sisters',
                                                              city: 'Sukkur',
                                                              lat: '28.8876721',
                                                              long:
                                                                  '66.6576375',
                                                              desc:
                                                                  'Tomb of Seven Sisters is also known as Sateen Jo Aastan. It is located on the left bank of the Indus River near Rohri, Sindh, Pakistan. The place was named as “safae-e-safa” built by Mir Abu al Qasim Namkeen when he was the governor of the Bakhar. He used this great scenic place as cultural gathering place, particularly in full moon nights. Sateen Jo Aastan is the resting place for the Seven Female-friends. According to folklore these female friends resided here. These unmarried female-friends veiled themselves from all males, a practice called purdah. But for the fear of a tyrannical raja resulted in their disappearance, possibly in a cave in the side of a hill. Thus they became satti. It is probable that this folklore has its origins in the Hindu ritual of sati, a ritual where widows burnt themselves or were burnt on their dead husband pyre.',
                                                              img:
                                                                  'assets/images/Places/Sindh/Sukkur/Tomb of Seven Sisters.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        : null,
                                    onTap: () {
                                      c3 = !c3;
                                      setState(() {});
                                    },
                                  )),
                              Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                    trailing: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      "Jamshoro",
                                      style: TextStyle(
                                        fontFamily: "mainTextStyle",
                                      ),
                                    ),
                                    subtitle: c4
                                        ? Card(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  title: Text(
                                                    "Ranikot Fort (The Great Wall Of Sindh)",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Ranikot Fort (The Great Wall Of Sindh)',
                                                              city: 'Jamshoro',
                                                              lat: '25.8908178',
                                                              long:
                                                                  '67.9052622',
                                                              desc:
                                                                  'Ranikot Fort also known as Rannikot is a historical Talpur fort near Sann, Jamshoro District, Sindh in Pakistan. Ranikot Fort is also known as The Great Wall of Sindh and is believed to be the world largest fort, with a circumference of approximately 32 kilometres . The fort ramparts have been compared to the Great Wall of China.  The site was nominated in 1993 by the Pakistan National Commission for UNESCO world heritage status, and has since been on the tentative list of UNESCO World Heritage Sites. The fort is listed as a historical site under the Antiquities Act, 1975 and its subsequent amendments, and is provided protection',
                                                              img:
                                                                  'assets/images/Places/Sindh/Jamshoro/Ranikot Fort (The Great Wall Of Sindh).jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Kirthar National Park",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Kirthar National Park',
                                                              city: 'Jamshoro',
                                                              lat: '25.6910637',
                                                              long:
                                                                  '67.5231713',
                                                              desc:
                                                                  'The Kirthar National Park is situated in the Kirthar Mountains in Jamshoro District in Sindh, Pakistan. It was established in 1974 and encompasses over 3,087 km2, making it the third largest national park in Pakistan. Wildlife in the park comprises leopard, striped hyena, Indian wolves, honey badger, urial, chinkara gazelles and rare Sindh ibex. Blackbuck are kept in enclosures for a reintroduction project.',
                                                              img:
                                                                  'assets/images/Places/Sindh/Jamshoro/Kirthar National Park.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    "Mohenjo-daro",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          "mainTextStyle",
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) => PunjabPlacesScreen(
                                                              number:
                                                                  widget.number,
                                                              name: widget.name,
                                                              userCityy:
                                                                  widget.city,
                                                              place:
                                                                  'Mohenjo-daro',
                                                              city: 'Jamshoro',
                                                              lat: '27.3242933',
                                                              long:
                                                                  '63.2577593',
                                                              desc:
                                                                  'Mohenjo-daro is reputed to signify “the mound of the dead.” The archaeological importance of the site was first recognized in 1922, one year after the discovery of Harappa. Subsequent excavations revealed that the mounds contain the remains of what was once the largest city of the Indus civilization',
                                                              img:
                                                                  'assets/images/Places/Sindh/Jamshoro/Mohenjo-daro.jpg',
                                                              veh1: 'Car',
                                                              veh2: 'Bike',
                                                              veh3: 'Van'),
                                                        ));
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        : null,
                                    onTap: () {
                                      c4 = !c4;
                                      setState(() {});
                                    },
                                  )),
                            ],
                          ),
                        )
                      : widget.prov == 'balochistan'
                          ? Container(
                              padding: EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Card(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ListTile(
                                        trailing: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        title: Text(
                                          "Gwadar",
                                          style: TextStyle(
                                            fontFamily: "mainTextStyle",
                                          ),
                                        ),
                                        subtitle: c1
                                            ? Card(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        "Gawadar Port",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Gawadar Port',
                                                                  city:
                                                                      'Gawadar',
                                                                  lat:
                                                                      '25.1104955',
                                                                  long:
                                                                      '62.339648',
                                                                  desc:
                                                                      'The Gwadar Port is situated on the Arabian Sea at Gwadar in Balochistan province of Pakistan and is under the administrative control of the Maritime Secretary of Pakistan and operational control of the China Overseas Port Holding Company.  The port features prominently in the China–Pakistan Economic Corridor (CPEC) plan, and is considered to be a link between the Belt and Road Initiative and the Maritime Silk Road projects. It is about 120 kilometres southwest of Turbat, and 170 kilometres to the east of Chabahar Port (Sistan and Balochistan Province in Iran).  Gwadar potential to be a deep water sea port was first noted in 1954, while the city was still under Omani sovereignty. Plans for construction of the port were not realised until 2007, when the port was inaugurated by Pervez Musharraf after four years of construction, at a cost of USD248 million',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Gwadar/Gawadar Port.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : null,
                                        onTap: () {
                                          c1 = !c1;
                                          setState(() {});
                                        },
                                      )),
                                  Card(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ListTile(
                                        trailing: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        title: Text(
                                          "Sibi",
                                          style: TextStyle(
                                            fontFamily: "mainTextStyle",
                                          ),
                                        ),
                                        subtitle: c2
                                            ? Card(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        "Bolan Pass",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Bolan Pass',
                                                                  city: 'Sibi',
                                                                  lat:
                                                                      '29.4535319',
                                                                  long:
                                                                      '67.4946055',
                                                                  desc:
                                                                      'Bolan Pass is a valley and a natural gateway, through the Toba Kakar range in Balochistan province of Pakistan, 120 km south of the Afghanistan border. The pass is an 89 km stretch of the Bolan river valley from Rindli in the south to Darwaza near Kolpur in the north.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Sibi/Bolan Pass.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Fort Mir Chakar Khan",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Fort Mir Chakar Khan',
                                                                  city: 'Sibi',
                                                                  lat:
                                                                      '30.9169997',
                                                                  long:
                                                                      '73.5105706',
                                                                  desc:
                                                                      'Mir Chakar fort is one of famous 15th century forts situated at outskirt in Sibi. You will find a very old traditional caravanserai, the Sohbat Serai, constructed by the tribal chief Sardar of that area Sohbat Khan here too. The Caravan sarai here is just the rare glimpse of old times when Camels were the only means of travel. It’s worth seeing for the historians. The great Balochi worrier and the head of Rind Tribe then died in 1565.His tomb was constructed in the area of Satghara which is situated in Okara district now by his people who accompanied him after leaving Baluchistan. This rich historical fort owned a wooden big door which might remind us of the old was tactics but due to less attention by Governments it went off in revenges of time. The particular authorities should take notice for taking care of this historical treasure.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Sibi/Fort Mir Chakar Khan.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Mehrgarh",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Mehrgarh',
                                                                  city: 'Sibi',
                                                                  lat:
                                                                      '29.3873272',
                                                                  long:
                                                                      '67.6095967',
                                                                  desc:
                                                                      'Mehrgarh is a Neolithic archaeological site situated on the Kacchi Plain of Balochistan in Pakistan. It is located near the Bolan Pass, to the west of the Indus River and between the modern-day Pakistani cities of Quetta, Kalat and Sibi. Mehrgarh is the earliest known Neolithic site in the northwest Indian subcontinent, with early evidence of farming, herding and metallurgy. The site is located on the principal route between what is now Afghanistan and the Indus Valley: this route was also undoubtedly part of a trading connection established quite early between the Near East and the Indian subcontinent.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Sibi/Mehrgarh.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Pir Gheib",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Pir Gheib',
                                                                  city: 'Sibi',
                                                                  lat:
                                                                      '29.7603423',
                                                                  long:
                                                                      '67.302220',
                                                                  desc:
                                                                      'Pir Ghaib Waterfalls are waterfalls situated in the Bolan Valley, 70 kilometres from Quetta, in Balochistan, Pakistan. Here a waterfall cascades down rocky mountain side making its way through many streams and ponds among the shady palm trees. ',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Sibi/Pir Gheib.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Victoria Hall",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Victoria Hall',
                                                                  city: 'Sibi',
                                                                  lat:
                                                                      '29.5462797',
                                                                  long:
                                                                      '67.8784594',
                                                                  desc:
                                                                      'In 1878, after an earlier assault on the town in 1841, the British captured Sibi and renamed it Sandemanabad, for Robert Sandeman. The most imposing of the extant buildings from the British era is the 1903 Queen Victoria Memorial Hall, now named Jirga Hall. It is so named because it was the assembly chamber for the British and the leading tribal notables during the annual jirga (council of tribal elders) held during the Sibi Mela.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Sibi/Victoria Hall.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : null,
                                        onTap: () {
                                          c2 = !c2;
                                          setState(() {});
                                        },
                                      )),
                                  Card(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ListTile(
                                        trailing: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        title: Text(
                                          "Quetta",
                                          style: TextStyle(
                                            fontFamily: "mainTextStyle",
                                          ),
                                        ),
                                        subtitle: c3
                                            ? Card(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        "Hanna Lake",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Hanna Lake',
                                                                  city:
                                                                      'Quetta',
                                                                  lat:
                                                                      '30.2554227',
                                                                  long:
                                                                      '67.101193',
                                                                  desc:
                                                                      'Hanna Lake is a lake in Urak Valley near Quetta, in Balochistan Province, in southwestern Pakistan. It is surrounded by mountains. Hanna Lake is one of the most visited and accessible lakes in Balochistan. There is a lakeside restaurant with picnic tables shaded by pine trees at the end of the river, where families can enjoy the food and weather. On the eastern side of the lake stands the Hayat Durrani Water Sports Academy , the first and only rowing, canoeing, kayaking and sailing training and championships organising centre in Balochistan Province, with provision of rough swimming facility',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Quetta/Hanna Lake.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Hazarganji Chiltan National Park",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Hazarganji Chiltan National Park',
                                                                  city:
                                                                      'Quetta',
                                                                  lat:
                                                                      '30.2227193',
                                                                  long:
                                                                      '66.7370393',
                                                                  desc:
                                                                      'Hazarganji Chiltan National Park is a national park in the Mastung District of western Balochistan Province of Pakistan. It lies between Chiltan on its west and Hazarganji on the east. The park was established in 1980 to provide the habitat to rare Chiltan ibexes found in the area.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Quetta/Hazarganji Chiltan National Park.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "The Urak Valley",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'The Urak Valley',
                                                                  city:
                                                                      'Quetta',
                                                                  lat:
                                                                      '30.2755972',
                                                                  long:
                                                                      '67.1821123',
                                                                  desc:
                                                                      'Urak Valley, also known as the Hanna Urak Valley, is a valley surrounded by mountains in the Quetta District of Balochistan Province, in western Pakistan. It is located near Hana Lake, and 28 kilometres from Quetta city.A small waterfall at its end marks entrance to the adjacent Wali Tangi Dam.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Quetta/The Urak Valley.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : null,
                                        onTap: () {
                                          c3 = !c3;
                                          setState(() {});
                                        },
                                      )),
                                  Card(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ListTile(
                                        trailing: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        title: Text(
                                          "Chaman",
                                          style: TextStyle(
                                            fontFamily: "mainTextStyle",
                                          ),
                                        ),
                                        subtitle: c4
                                            ? Card(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        "Mehrgarh Civilization",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Mehrgarh Civilization',
                                                                  city:
                                                                      'Chaman',
                                                                  lat:
                                                                      '29.3873272',
                                                                  long:
                                                                      '67.6070218',
                                                                  desc:
                                                                      'Mehrgarh is a Neolithic archaeological site situated on the Kacchi Plain of Balochistan in Pakistan. It is located near the Bolan Pass, to the west of the Indus River and between the modern-day Pakistani cities of Quetta, Kalat and Sibi.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Chaman/Mehrgarh Civilization.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : null,
                                        onTap: () {
                                          c4 = !c4;
                                          setState(() {});
                                        },
                                      )),
                                  Card(
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: ListTile(
                                        trailing: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        title: Text(
                                          "Ziarat",
                                          style: TextStyle(
                                            fontFamily: "mainTextStyle",
                                          ),
                                        ),
                                        subtitle: c5
                                            ? Card(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      title: Text(
                                                        "Quaid-e-Azam Residency",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Quaid-e-Azam Residency',
                                                                  city:
                                                                      'Ziarat',
                                                                  lat:
                                                                      '30.3788827',
                                                                  long:
                                                                      '67.7260475',
                                                                  desc:
                                                                      'Quaid-e-Azam Residency also known as Ziarat Residency, is located in Ziarat, Balochistan, Pakistan. It is where Muhammad Ali Jinnah spent the last two months and ten days of his life, nursed by A. S. Nathaniel. It is the most famous landmark of the city, constructed in 1892 during the British Raj. The building is a wooden structure, originally designed as a sanatorium before being converted into the summer residence of the agent of the Governor General. It is declared a heritage site and is of great architectural importance.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Ziarat/Quaid-e-Azam Residency.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Ziarat Juniper Forest",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Ziarat Juniper Forest',
                                                                  city:
                                                                      'Ziarat',
                                                                  lat:
                                                                      '30.365391',
                                                                  long:
                                                                      '67.7308113',
                                                                  desc:
                                                                      'These forests are spread around mountainous area of Ziarat and Mount Zarghoon. The mountains range from 1,181 to 3,488 meters elevation.  The forests cover an area of about 110,000 hectares, and it is the largest juniper forest in Pakistan.  The climate is temperate and semi-arid, with mild summers and cold winters. Average annual rainfall is 269 mm, with a maximum of 74 mm in July and a minimum of 3 mm in January. July is the hottest month (27.4 °C), and January the coldest (7.9 °C). Relative humidity ranges from 35% in January to 60% in September. Snow falls between November and April, with a maximum (68 cm) in February.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Ziarat/Ziarat Juniper Forest.jpg',
                                                                  veh1: 'Van',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                        "Zizri Forest Valley",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "mainTextStyle",
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => PunjabPlacesScreen(
                                                                  number: widget
                                                                      .number,
                                                                  name: widget
                                                                      .name,
                                                                  userCityy:
                                                                      widget
                                                                          .city,
                                                                  place:
                                                                      'Zizri Forest Valley',
                                                                  city:
                                                                      'Ziarat',
                                                                  lat:
                                                                      '30.365391',
                                                                  long:
                                                                      '67.7282364',
                                                                  desc:
                                                                      'Zizri is one of the most beautiful valleys of Ziarat. This valley possesses a breathtaking beauty.The valley has very large and some of the oldest Juniper trees. It has untouched natural beauty which make it unique from other valleys of Ziarat. Zizri valley at a distance of about 12 kms from Ziarat town. It  located at an elevation of 2,250 m above sea level. It is  situated on the southern edge of the Ziarat It is mostly mountainous area with thick juniper forest, wild flowers and many herb plants. Zezri valley is accessible from Ziarat. The route goes through Prospect Point . The drive from prospect point is quite picturesque and the road passes through a thick Juniper forest with occasional glimpses of the valleys down below.The road is shingle and  rough from Prospect Point to the Zizri valley.',
                                                                  img:
                                                                      'assets/images/Places/Balochistan/Ziarat/Zizri Forest Valley.jpg',
                                                                  veh1: 'Car',
                                                                  veh2: 'Bike',
                                                                  veh3: 'Van'),
                                                            ));
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : null,
                                        onTap: () {
                                          c5 = !c5;
                                          setState(() {});
                                        },
                                      )),
                                ],
                              ),
                            )
                          : widget.prov == 'kpk'
                              ? Container(
                                  padding: EdgeInsets.only(top: 10),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Card(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: ListTile(
                                            trailing: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                              "Peshawar",
                                              style: TextStyle(
                                                fontFamily: "mainTextStyle",
                                              ),
                                            ),
                                            subtitle: c1
                                                ? Card(
                                                    color: Colors.white,
                                                    child: Column(
                                                      children: [
                                                        ListTile(
                                                          title: Text(
                                                            "Jamrud Fort",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Jamrud Fort',
                                                                      city:
                                                                          'Peshawar',
                                                                      lat:
                                                                          '34.0034291',
                                                                      long:
                                                                          '71.3783551',
                                                                      desc:
                                                                          'The Jamrud Fort is located beside Bab-e-Khyber at the entrance to the Khyber Pass from the Peshawar side in the tribal district of Khyber KPK, Pakistan. After death of Sardar General Hari Singh Nalwa, Khalsa Sarkar Wazir Jawahar Singh nominated Sardar General Gurmukh Singh Lamba as chief administrative and military commander to restore and consolidate the Khalsa army gains. General Sardar Gurmukh Singh Lamba was nominated as chief administrative and military commander to consolidate the gains of Khalsa Sarkar',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Peshawar/Jamrud Fort.png',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Bab-e-Khyber",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Bab-e-Khyber',
                                                                      city:
                                                                          'Peshawar',
                                                                      lat:
                                                                          '34.0024033',
                                                                      long:
                                                                          '71.3775493',
                                                                      desc:
                                                                          'The Bab-e-Khyber is a monument situated at the entrance of the Khyber Pass in the Khyber Pakhtunkhwa province of Pakistan. The gate is located immediately west of Peshawar, with the historic Jamrud Fort lying adjacent to it',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Peshawar/Bab-e-Khyber.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Peshawar Museum",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Peshawar Museum',
                                                                      city:
                                                                          'Peshawar',
                                                                      lat:
                                                                          '34.0078293',
                                                                      long:
                                                                          '71.5582064',
                                                                      desc:
                                                                          'The Peshawar Museum is a museum located in Peshawar, capital of Pakistan Khyber Pakhtunkhwa province. The Peshawar Museum is notable for its collection of Buddhist artwork dating from the ancient Gandhara region.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Peshawar/Peshawar Museum.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Sethi House",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Sethi House',
                                                                      city:
                                                                          'Peshawar',
                                                                      lat:
                                                                          '34.0086764',
                                                                      long:
                                                                          '71.5677692',
                                                                      desc:
                                                                          'Sethi Mohallah sometimes called Sethian Mohallah, is an old and traditionally arranged neighbourhood in the old city of Peshawar, Pakistan. The mohallah contains seven South Asian mansions built by the Sethi family that were built in a style reminiscent of Central Asia with elaborate wooden carvings. The houses were completed in the late 19th century. The homes were designed with inspiration from the vernacular architecture of Bukhara. Two neatly decorated tehkhanas, a balakhana, dalaans, chinikhanas and fountains can be found in each house. The ceilings are painted and the walls are decorated with mirror work.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Peshawar/Sethi House.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Shahi Bagh",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Shahi Bagh',
                                                                      city:
                                                                          'Peshawar',
                                                                      lat:
                                                                          '34.0193471',
                                                                      long:
                                                                          '71.5739687',
                                                                      desc:
                                                                          'Shahi Bagh is one of the oldest and largest gardens in Peshawar, Khyber Pakhtunkhwa Pakistan. It is a Mughal-era park located in the Peshawar city near the Arbab Niaz Stadium and has been a hub for political meetings, literary and social gatherings in the city',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Peshawar/Shahi Bagh.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : null,
                                            onTap: () {
                                              c1 = !c1;
                                              setState(() {});
                                            },
                                          )),
                                      Card(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: ListTile(
                                            trailing: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                              "Abbottabad",
                                              style: TextStyle(
                                                fontFamily: "mainTextStyle",
                                              ),
                                            ),
                                            subtitle: c2
                                                ? Card(
                                                    color: Colors.white,
                                                    child: Column(
                                                      children: [
                                                        ListTile(
                                                          title: Text(
                                                            "Dahamtore Village",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Dahamtore Village',
                                                                      city:
                                                                          'Abbottabad',
                                                                      lat:
                                                                          '34.1369213',
                                                                      long:
                                                                          '73.2760084',
                                                                      desc:
                                                                          'Dahamtore is situated at about 6 km towards east of Abbottabad, Hazara, Khyber Pakhtunkhwa, Pakistan and is the largest village and union council of Abbottabad. Their language is Hindko which is the traditional mother tongue of the Hazara Division but in some villages specially Nagakki village, Gojri is also mother tongue . Dhamtour village is the gate way to places like Murree, Nathiagali, Dunga Gali, Bara Gali, Ayubia National Park, Miranjani, Mukeshpuri and most famous picnic spot of Abbottabad, Harnoi. The Union council is located in Abbottabad District in the Khyber-Pakhtunkhwa province of Pakistan.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Abbottabad/Dahamtore Village.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Mushkpuri Top",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Mushkpuri Top',
                                                                      city:
                                                                          'Abbottabad',
                                                                      lat:
                                                                          '34.0602321',
                                                                      long:
                                                                          '73.4307933',
                                                                      desc:
                                                                          'Mukshpuri, Mushkpuri, or Mukeshpuri is a 2,800-metre-high mountain in the Nathia Gali Hills, in the Circle Bakote Region of Abbottabad District of the Khyber Pakhtunkhwa province in northern Pakistan. It is 90 kilometres north of Islamabad, just above Dunga Gali in the Nathia Gali area of Ayubia National Park.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Abbottabad/Mushkpuri Top.jpg',
                                                                      veh1:
                                                                          'car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Sajikot Waterfall",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Sajikot Waterfall',
                                                                      city:
                                                                          'Abbottabad',
                                                                      lat:
                                                                          '34.1285496',
                                                                      long:
                                                                          '73.0855305',
                                                                      desc:
                                                                          'Sajikot Waterfall is a waterfall located in Havelian Tehsil, Abbottabad District, in Pakistan Khyber Pakhtunkhwa Province. It is a popular tourist destination in Abbottabad District. It is about 27 kilometres from Havelian and 40 kilometres from Abbottabad District. A newly constructed narrow road from Havelian to Sajikot allows visitors to take their cars right at the top of the waterfall.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Abbottabad/Sajikot Waterfall.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Shimla Peak",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Shimla Peak',
                                                                      city:
                                                                          'Abbottabad',
                                                                      lat:
                                                                          '34.1584002',
                                                                      long:
                                                                          '70.7572455',
                                                                      desc:
                                                                          'The hills cradling Abbottabad are Shimla Peak to the northwest and Sarban Peak to the south. Shimla cool, pine-clad summit is woven with trails and features fine panoramas of the town and its surroundings. You can walk up or take a passenger Suzuki from upper Pine View Rd; ask for Shimla pahari.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Abbottabad/Shimla Peak.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Thandiani Top",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Thandiani Top',
                                                                      city:
                                                                          'Abbottabad',
                                                                      lat:
                                                                          '34.2310552',
                                                                      long:
                                                                          '73.3523387',
                                                                      desc:
                                                                          'Thandiani is a hill station in the Galyat area of the Khyber Pakhtunkhwa Province of Pakistan. Thandiani is located in the northeast of Abbottabad District and is about 37.5 kilometres from Abbottabad in the foothills of the Himalayas. To the east beyond the Kunhar River lies the snow-covered Pir Panjal mountain range of Kashmir. Visible to the north and northeast are the mountains of Kohistan and Kaghan. To the northwest are the snowy ranges of Swat and Chitral. The hills of Thandiani are about 2,750 metres above sea level. Most of the people residing here belong to the Qureshi- Damal , Karlal, Syed, Awan, Abbasi, and Gujjar tribes. A beautiful trek leads to Thandiani from Abbottabad that passes through Dagri Naka.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Abbottabad/Thandiani Top.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : null,
                                            onTap: () {
                                              c2 = !c2;
                                              setState(() {});
                                            },
                                          )),
                                      Card(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: ListTile(
                                            trailing: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                              "Naran",
                                              style: TextStyle(
                                                fontFamily: "mainTextStyle",
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PunjabPlacesScreen(
                                                            number:
                                                                widget.number,
                                                            name: widget.name,
                                                            userCityy:
                                                                widget.city,
                                                            place: 'Naran',
                                                            city: 'Naran',
                                                            lat: '34.9033148',
                                                            long: '73.6340118',
                                                            desc:
                                                                'Naran is a town and popular tourist destination in upper Kaghan Valley in the Mansehra District of the Khyber Pakhtunkhwa province of Pakistan. It is located 119 kilometers from Mansehra city at the altitude of 2,409 meters. It is located about 65 kilometers away from Babusar Top',
                                                            img:
                                                                'assets/images/Places/Khyber Pakhtunkhwa/Naran/Naran.jpg',
                                                            veh1: 'Car',
                                                            veh2: 'Bike',
                                                            veh3: 'Van'),
                                                  ));
                                            },
                                          )),
                                      Card(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: ListTile(
                                            trailing: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                              "Shogran",
                                              style: TextStyle(
                                                fontFamily: "mainTextStyle",
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PunjabPlacesScreen(
                                                            number:
                                                                widget.number,
                                                            name: widget.name,
                                                            userCityy:
                                                                widget.city,
                                                            place: 'Shogran',
                                                            city: 'Shogran',
                                                            lat: '34.6389279',
                                                            long: '73.4578943',
                                                            desc:
                                                                'Shogran is a hill station situated on a plateau in the Kaghan Valley, northern Pakistan at a height of 2,362 metres above sea level. It is located in the province of Khyber Pakhtunkhwa. Shogran is located 34 kilometres away from Balakot. The road from Islamabad to the region is paved and measures 212 kilometres.',
                                                            img:
                                                                'assets/images/Places/Khyber Pakhtunkhwa/Shogran/Shogran.jpg',
                                                            veh1: 'Car',
                                                            veh2: 'Bike',
                                                            veh3: 'Van'),
                                                  ));
                                            },
                                          )),
                                      Card(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: ListTile(
                                            trailing: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                            title: Text(
                                              "Swat",
                                              style: TextStyle(
                                                fontFamily: "mainTextStyle",
                                              ),
                                            ),
                                            subtitle: c4
                                                ? Card(
                                                    color: Colors.white,
                                                    child: Column(
                                                      children: [
                                                        ListTile(
                                                          title: Text(
                                                            "Kumrat Valley",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Kumrat Valley',
                                                                      city:
                                                                          'Swat',
                                                                      lat:
                                                                          '35.5548422',
                                                                      long:
                                                                          '72.1260553',
                                                                      desc:
                                                                          'Kumrat is a valley in the Upper Dir District of Khyber Pakhtunkhwa province of Pakistan. Kumrat Valley is located about 45 minutes away from the town of Thal on the banks of the Panjkora River, and is among the most popular tourist spots in Khyber Pakhtunkhwa.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Swat/Kumrat Valley.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Malam Jabba",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Malam Jabba',
                                                                      city:
                                                                          'Swat',
                                                                      lat:
                                                                          '34.800638',
                                                                      long:
                                                                          '72.5689907',
                                                                      desc:
                                                                          'Malam Jabba is home to one of the two ski resorts in Pakistan; the other is at Naltar, Gilgit Baltistan. On the main Madyan-Kalam road, the road turns to the right at Manglor town , for the Malam-Jabba Dara which has a series of small villages and settlements like Salanda, Jehanabad, Talegraam, Badar, Ser, Malam, Kishora, Spine Oba, and finally Jabba. Malam is a small village which comes prior to Kishora village on the main Malam-Jabba road. Malam is nearly 17 km from Manglor while Kishora is at 18 km distance. Jabba  is the upper most part of the whole Dara . The Malam Jabba Ski Resort, owned by the Pakistan Tourism Development Corporation, had a ski slope of about 800m with the highest point of the slope 2804 m above sea level. Malam Jabba Ski Resort was the joint effort of the Pakistan with its Austrian counterpart. The resort was equipped with modern facilities including roller/ice-skating rinks, chair lifts, skiing platforms, telephones and snow clearing equipment. There was a wooden motel which had been built to house the construction workers of the ski slope and then opened to the publi',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Swat/Malam Jabba.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Peuchar Valley",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Peuchar Valley',
                                                                      city:
                                                                          'Swat',
                                                                      lat:
                                                                          '35.012663',
                                                                      long:
                                                                          '72.1790153',
                                                                      desc:
                                                                          'The Peuchar Valley is now The Land of Peace and  Beauty. The valley is still emerging as a tourist destination. Also, it has a great potential to attract tourists from all around the world. Therefore, if it develops properly it can serve Pakistan as a means of generating revenue from all over the globe. Moreover, the enhancement of places like Peuchar Valley will also improve the goodwill of Pakistan among other countries. Peuchar valley is a truly fantastic place to visit and enjoy the serenity of this breathtaking spot',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Swat/Peuchar Valley.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Shangla Top",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Shangla Top',
                                                                      city:
                                                                          'Swat',
                                                                      lat:
                                                                          '34.8809693',
                                                                      long:
                                                                          '72.5883383',
                                                                      desc:
                                                                          'Shangla Distric is a district in Malakand Division of Khyber Pakhtunkhwa, Pakistan. The district headquarter is located at Alpuri, while the largest city and commercial center is Besham. The district was established in 1995, having previously been a subdivision of Swat District. The total area of the district is 1,586 square kilometers. Shangla comprises three subdivisions, Alpuri, Puran and Besham tehsils. Shangla was a sub-division of the Swat district in the Khyber Pakhtunkhwa province of Pakistan until it was granted the status of a separate district in 1995, primarily owing to the efforts of Haji Badiu Zaman, a political leader and community figure, assassinated in 1994, and his son, Afsar ul Mulk.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Swat/Shangla Top.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: Text(
                                                            "Shingrai Waterfall",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "mainTextStyle",
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => PunjabPlacesScreen(
                                                                      number: widget
                                                                          .number,
                                                                      name: widget
                                                                          .name,
                                                                      userCityy:
                                                                          widget
                                                                              .city,
                                                                      place:
                                                                          'Shingrai Waterfall',
                                                                      city:
                                                                          'Swat',
                                                                      lat:
                                                                          '34.7857646',
                                                                      long:
                                                                          '72.4794326',
                                                                      desc:
                                                                          'Shingrai Waterfall also known as Shingro Dand is a waterfall located in Shingrai Manglawar in Swat District of Khyber Pakhtunkhwa the Province of Pakistan. It is known for its high and beautiful surrounding. It is about 18 kilometres from Mingora. Shingrai Waterfall is about 10,000 feet above sea level.',
                                                                      img:
                                                                          'assets/images/Places/Khyber Pakhtunkhwa/Swat/Shingrai Waterfall.jpg',
                                                                      veh1:
                                                                          'Car',
                                                                      veh2:
                                                                          'Bike',
                                                                      veh3:
                                                                          'Van'),
                                                                ));
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : null,
                                            onTap: () {
                                              c4 = !c4;
                                              setState(() {});
                                            },
                                          )),
                                    ],
                                  ),
                                )
                              : widget.prov == 'gilgit baltistan'
                                  ? Container(
                                      padding: EdgeInsets.only(top: 10),
                                      width: double.infinity,
                                      child: Column(
                                        children: [
                                          Card(
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: ListTile(
                                                trailing: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                                title: Text(
                                                  "Mingora",
                                                  style: TextStyle(
                                                    fontFamily: "mainTextStyle",
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Mingora',
                                                                city:
                                                                    'Gilgit Baltistan',
                                                                lat:
                                                                    '34.7687951',
                                                                long:
                                                                    '72.291040',
                                                                desc:
                                                                    'Mingora is a city in the Swat District of Khyber Pakhtunkhwa, Pakistan. Located on the Swat River, it is the 3rd largest city in Khyber Pakhtunkhwa and the 26th largest in Pakistan.',
                                                                img:
                                                                    'assets/images/Places/Gilgit Baltistan/Mingora.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                      ));
                                                },
                                              )),
                                          Card(
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: ListTile(
                                                trailing: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                                title: Text(
                                                  "Skardu",
                                                  style: TextStyle(
                                                    fontFamily: "mainTextStyle",
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place: 'Skardu',
                                                                city:
                                                                    'Gilgit Baltistan',
                                                                lat:
                                                                    '35.3289792',
                                                                long:
                                                                    '75.3977928',
                                                                desc:
                                                                    'Skardu is a city located in Gilgit−Baltistan, Pakistan. Skardu serves as the capital of Skardu District and the Baltistan Division. It is situated at an elevation of nearly 2,500 metres in the Skardu Valley, at the confluence of the Indus and Shigar Rivers',
                                                                img:
                                                                    'assets/images/Places/Gilgit Baltistan/Skardu.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                      ));
                                                },
                                              )),
                                          Card(
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: ListTile(
                                                trailing: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                                title: Text(
                                                  "Danyor",
                                                  style: TextStyle(
                                                    fontFamily: "mainTextStyle",
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place: 'Danyor',
                                                                city:
                                                                    'Gilgit Baltistan',
                                                                lat:
                                                                    '35.9244096',
                                                                long:
                                                                    '74.393535',
                                                                desc:
                                                                    'Danyor is a city in the namesake sub-division in Gilgit District lies across the river Gilgit in the outskirts of the capital of Gilgit-Baltistan. It is known for its green fields, and poplar trees. The world highest paved road KKH passes through its landscape',
                                                                img:
                                                                    'assets/images/Places/Gilgit Baltistan/Danyor.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                      ));
                                                },
                                              )),
                                          Card(
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: ListTile(
                                                trailing: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                                title: Text(
                                                  "Diamir",
                                                  style: TextStyle(
                                                    fontFamily: "mainTextStyle",
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place: 'Diamir',
                                                                city:
                                                                    'Gilgit Baltistan',
                                                                lat:
                                                                    '35.4969694',
                                                                long:
                                                                    '73.269480',
                                                                desc:
                                                                    'The Diamer District, also spelled Diamir District, is a district in Gilgit-Baltistan territory of Pakistan. The headquarters of the district is the town of Chilas.',
                                                                img:
                                                                    'assets/images/Places/Gilgit Baltistan/Diamir.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                      ));
                                                },
                                              )),
                                          Card(
                                              shape: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: ListTile(
                                                trailing: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black,
                                                ),
                                                title: Text(
                                                  "Gilgit",
                                                  style: TextStyle(
                                                    fontFamily: "mainTextStyle",
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place: 'Gilgit',
                                                                city:
                                                                    'Gilgit Baltistan',
                                                                lat:
                                                                    '35.9101232',
                                                                long:
                                                                    '74.2895523',
                                                                desc:
                                                                    'Gilgit is the capital city of the Pakistani-administered administrative territory of Gilgit–Baltistan in the disputed Kashmir region. The city is located in a broad valley near the confluence of the Gilgit River and the Hunza River. It is a major tourist destination in Pakistan, serving as a hub for trekking and mountaineering expeditions in the Karakoram mountain range. Gilgit was once a major centre for Buddhism; it was an important stop on the ancient Silk Road, and today serves as a major junction along the Karakoram Highway with road connections to China as well as the Pakistani cities of Skardu, Chitral, Peshawar, and Islamabad. Currently, it serves as a frontier station for the local tribal areas. The city economic activity is mainly focused on agriculture, with wheat, maize, and barley as the mainly-produced crops.',
                                                                img:
                                                                    'assets/images/Places/Gilgit Baltistan/Gilgit.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                      ));
                                                },
                                              )),
                                        ],
                                      ),
                                    )
                                  : widget.prov == 'islamabad city'
                                      ? Container(
                                          padding: EdgeInsets.only(top: 10),
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Faisal Mosque",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Faisal Mosque',
                                                                city:
                                                                    'Islamabad',
                                                                lat:
                                                                    '33.7204997',
                                                                long:
                                                                    '73.0379528',
                                                                desc:
                                                                    'The Faisal Mosque is the largest mosque in Pakistan, located in the national capital city of Islamabad. Completed in 1986, it was designed by Turkish architect Vedat Dalokay, shaped like a desert Bedouin tent, is an iconic symbol of Islamabad throughout the world. It is situated at the north end of Faisal Avenue, putting it at the northernmost end of the city and at the foot of Margalla Hills, the westernmost foothills of the Himalayas. It is located on an elevated area of land against a picturesque backdrop of the Margalla Hills. This enviable location represents the mosque great importance and allows it to be seen from miles around day and night. The Faisal Mosque was conceived as the National Mosque of Pakistan and named after the late King Faisal bin Abdul-Aziz of Saudi Arabia, who supported and financed the project',
                                                                img:
                                                                    'assets/images/Places/Islamabad/Faisal Mosque.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Margalla Hills",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Margalla Hills',
                                                                city:
                                                                    'Islamabad',
                                                                lat:
                                                                    '32.5985617',
                                                                long:
                                                                    '72.3641225',
                                                                desc:
                                                                    'The Margalla Hills are a hill range within the Margalla Hills National Park on the northern edge of Islamabad Capital Territory, Pakistan, just south of Haripur District, Khyber Pakhtunkhwa. They are part of the Himalayan foothills. The Margalla range has an area of 12,605 hectares.',
                                                                img:
                                                                    'assets/images/Places/Islamabad/Margalla Hills.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Lok Virsa Heritage Museum.",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Lok Virsa Heritage Museum',
                                                                city:
                                                                    'Islamabad',
                                                                lat:
                                                                    '32.574668',
                                                                long:
                                                                    '72.3641222',
                                                                desc:
                                                                    'Heritage Museum, also known as Lok Virsa Museum is a museum administered and managed by Lok Virsa - National Institute of Folk & Traditional Heritage. It is a museum of history and culture in Islamabad, Pakistan, located on the Shakarparian Hills showcasing the living cultures of Pakistan',
                                                                img:
                                                                    'assets/images/Places/Islamabad/Lok Virsa Heritage Museum.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Rawal Lake",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Rawal Lake',
                                                                city:
                                                                    'Islamabad',
                                                                lat:
                                                                    '33.7051242',
                                                                long:
                                                                    '73.1281806',
                                                                desc:
                                                                    'Rawal Lake in Pakistan is an artificial reservoir that provides the water needs for the cities of Rawalpindi and Islamabad. Korang River along with some other small streams coming from Margalla Hills have been set to form this artificial lake which covers an area of 8.8 km².',
                                                                img:
                                                                    'assets/images/Places/Islamabad/Rawal Lake.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Shakarparian National Park",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Shakarparian National Park',
                                                                city:
                                                                    'Islamabad',
                                                                lat:
                                                                    '32.5785735',
                                                                long:
                                                                    '72.3641223',
                                                                desc:
                                                                    'Shakarparian is a hill, and a national park located near the Zero Point Interchange in Islamabad, Pakistan. Pakistan Monument and Pakistan Monument Museum are also located in Shakarparian.',
                                                                img:
                                                                    'assets/images/Places/Islamabad/Shakarparian National Park.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.only(top: 10),
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Neelam Valley",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Neelam Valley',
                                                                city:
                                                                    'Azad Jammu and Kashmir',
                                                                lat:
                                                                    '34.5984783',
                                                                long:
                                                                    '73.8969969',
                                                                desc:
                                                                    'The Neelum River flows through this mountainous area known for its panoramic views.',
                                                                img:
                                                                    'assets/images/Places/Azad Jammu and Kashmir/Neelam Valley.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Arang Kel",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place:
                                                                    'Arang Kel',
                                                                city:
                                                                    'Azad Jammu and Kashmir',
                                                                lat:
                                                                    '34.8056267',
                                                                long:
                                                                    '74.3270369',
                                                                desc:
                                                                    'Arang Kel is a village and tourist spot in the Neelam valley of Azad Kashmir. It is located on the hilltop above Kel at an altitude of 8,379 feet',
                                                                img:
                                                                    'assets/images/Places/Azad Jammu and Kashmir/Arang Kel.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Sharda",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place: 'Sharda',
                                                                city:
                                                                    'Azad Jammu and Kashmir',
                                                                lat:
                                                                    '34.7927569',
                                                                long:
                                                                    '74.1860389',
                                                                desc:
                                                                    'Sharda, also known as Shardi, is a small Tehsil in Neelam District in Azad Kashmir, Pakistan. It is one of the two tehsils of Neelum district, and is located on the banks of the Neelum river at an altitude of 1,981 metres',
                                                                img:
                                                                    'assets/images/Places/Azad Jammu and Kashmir/Sharda.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Taobat",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place: 'Taobat',
                                                                city:
                                                                    'Azad Jammu and Kashmir',
                                                                lat:
                                                                    '34.7273198',
                                                                long:
                                                                    '74.7026216',
                                                                desc:
                                                                    'Taobat is a village in Sharda Tehsil in Neelam Valley, Azad Kashmir, Pakistan. It is located 200 kilometers from Muzaffarabad and 39 kilometers from Kel. It is the last station in Neelam valley. It is also the nearest location from where Neelam River enters Pakistani territory and becomes River Neelum',
                                                                img:
                                                                    'assets/images/Places/Azad Jammu and Kashmir/Taobat.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                              Card(
                                                  shape: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    title: Text(
                                                      "Kotli",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "mainTextStyle",
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => PunjabPlacesScreen(
                                                                number: widget
                                                                    .number,
                                                                name:
                                                                    widget.name,
                                                                userCityy:
                                                                    widget.city,
                                                                place: 'Kotli',
                                                                city:
                                                                    'Azad Jammu and Kashmir',
                                                                lat:
                                                                    '33.5028878',
                                                                long:
                                                                    '73.8667214',
                                                                desc:
                                                                    'Kotli is a city in Kotli District of Azad Kashmir in Pakistan. It lies on the Poonch River, and the river contains several waterfalls, including the Lala Waterfall near the town of Kotli, and the Gulpur Waterfalls at the village of Gulpur to the southwest',
                                                                img:
                                                                    'assets/images/Places/Azad Jammu and Kashmir/Kotli.jpg',
                                                                veh1: 'Car',
                                                                veh2: 'Bike',
                                                                veh3: 'Van'),
                                                          ));
                                                    },
                                                  )),
                                            ],
                                          ),
                                        )
            ],
          ),
        ),
      ),
    );
  }
}
