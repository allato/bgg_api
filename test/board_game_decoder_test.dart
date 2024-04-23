import 'package:bgg_api/src/xml/board_game_decoder.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  test('should decode board game from xml', () {
    // https://boardgamegeek.com/xmlapi2/thing?id=148228&stats=1&marketplace=1&videos=1
    final xml = '''<item type="boardgame" id="148228">
	<thumbnail>https://cf.geekdo-images.com/thumb/img/D4hkkHfOgu22PwgJomjplWAveuo=/fit-in/200x150/pic1904079.jpg</thumbnail>
	<image>https://cf.geekdo-images.com/original/img/PgaVULm0QKeFV2zTro4hJEb70Yk=/0x0/pic1904079.jpg</image>
	<name type="primary" sortindex="1" value="Splendor"/>
	<name type="alternate" sortindex="1" value="Розкіш"/>
	<name type="alternate" sortindex="1" value="Роскошь"/>
	<name type="alternate" sortindex="1" value="ספלנדור"/>
	<name type="alternate" sortindex="1" value="جواهري"/>
	<name type="alternate" sortindex="1" value="เกมค้าเพชร"/>
	<name type="alternate" sortindex="1" value="宝石の煌き"/>
	<name type="alternate" sortindex="1" value="璀璨宝石"/>
	<name type="alternate" sortindex="1" value="璀璨寶石"/>
	<name type="alternate" sortindex="1" value="스플렌더"/>
	<description>Splendor is a game of chip-collecting and card development. Players are merchants of the Renaissance trying to buy gem mines, means of transportation, shops&mdash;all in order to acquire the most prestige points. If you're wealthy enough, you might even receive a visit from a noble at some point, which of course will further increase your prestige.&#10;&#10;</description>
	<yearpublished value="2014"/>
	<minplayers value="2"/>
	<maxplayers value="4"/>
	<poll name="suggested_numplayers" title="User Suggested Number of Players" totalvotes="1105">
		<results numplayers="1">
			<result value="Best" numvotes="1"/>
			<result value="Recommended" numvotes="15"/>
			<result value="Not Recommended" numvotes="669"/>
		</results>
		<results numplayers="2">
			<result value="Best" numvotes="347"/>
			<result value="Recommended" numvotes="582"/>
			<result value="Not Recommended" numvotes="78"/>
		</results>
		<results numplayers="3">
			<result value="Best" numvotes="572"/>
			<result value="Recommended" numvotes="399"/>
			<result value="Not Recommended" numvotes="16"/>
		</results>
		<results numplayers="4">
			<result value="Best" numvotes="344"/>
			<result value="Recommended" numvotes="541"/>
			<result value="Not Recommended" numvotes="81"/>
		</results>
		<results numplayers="4+">
			<result value="Best" numvotes="4"/>
			<result value="Recommended" numvotes="27"/>
			<result value="Not Recommended" numvotes="543"/>
		</results>
	</poll>
	<playingtime value="30"/>
	<minplaytime value="30"/>
	<maxplaytime value="30"/>
	<minage value="10"/>
	<poll name="suggested_playerage" title="User Suggested Player Age" totalvotes="311">
		<results>
			<result value="2" numvotes="0"/>
			<result value="3" numvotes="0"/>
			<result value="4" numvotes="7"/>
			<result value="5" numvotes="12"/>
			<result value="6" numvotes="65"/>
			<result value="8" numvotes="155"/>
			<result value="10" numvotes="64"/>
			<result value="12" numvotes="5"/>
			<result value="14" numvotes="1"/>
			<result value="16" numvotes="2"/>
			<result value="18" numvotes="0"/>
			<result value="21 and up" numvotes="0"/>
		</results>
	</poll>
	<poll name="language_dependence" title="Language Dependence" totalvotes="168">
		<results>
			<result level="1" value="No necessary in-game text" numvotes="165"/>
			<result level="2" value="Some necessary text - easily memorized or small crib sheet" numvotes="1"/>
			<result level="3" value="Moderate in-game text - needs crib sheet or paste ups" numvotes="0"/>
			<result level="4" value="Extensive use of text - massive conversion needed to be playable" numvotes="0"/>
			<result level="5" value="Unplayable in another language" numvotes="2"/>
		</results>
	</poll>
	<link type="boardgamecategory" id="1002" value="Card Game"/>
	<link type="boardgamecategory" id="1021" value="Economic"/>
	<link type="boardgamecategory" id="1070" value="Renaissance"/>
	<link type="boardgamemechanic" id="2912" value="Contracts"/>
	<link type="boardgamemechanic" id="2041" value="Open Drafting"/>
	<link type="boardgamemechanic" id="2876" value="Race"/>
	<link type="boardgamemechanic" id="2004" value="Set Collection"/>
	<link type="boardgamefamily" id="77906" value="Category: Dized Tutorial"/>
	<link type="boardgamefamily" id="70360" value="Digital Implementations: Board Game Arena"/>
	<link type="boardgamefamily" id="78432" value="Digital Implementations: Google Play"/>
	<link type="boardgamefamily" id="77349" value="Digital Implementations: Steam"/>
	<link type="boardgamefamily" id="33250" value="Game: Splendor"/>
	<link type="boardgamefamily" id="27646" value="Mechanism: Tableau Building"/>
	<link type="boardgamefamily" id="78198" value="Misc: Watch It Played How To Videos"/>
	<link type="boardgameexpansion" id="178656" value="Brettspiel Adventskalender 2015"/>
	<link type="boardgameexpansion" id="231506" value="Brettspiel Adventskalender 2017"/>
	<link type="boardgameexpansion" id="301333" value="Splendor: 2019 Promo – Shen Wansan and Zhou Ying"/>
	<link type="boardgameexpansion" id="220653" value="Splendor: Cities of Splendor"/>
	<link type="boardgameexpansion" id="233847" value="Splendor: Cities of Splendor Promotional Tile"/>
	<link type="boardgameexpansion" id="279798" value="Splendor: Diane de Poitiers Promo Noble"/>
	<link type="boardgameexpansion" id="289795" value="Splendor: Dice Con 2019 Promo cards – Zhang Qian and Xiang Fei"/>
	<link type="boardgameexpansion" id="234005" value="Splendor: Dice Tower Promo Noble"/>
	<link type="boardgameexpansion" id="234162" value="Splendor: Guillaume Budé Promo Noble"/>
	<link type="boardgameexpansion" id="256783" value="Splendor: Jacques Cartier Promo Noble"/>
	<link type="boardgameexpansion" id="369554" value="Splendor: Nobles and Cities Promo"/>
	<link type="boardgameexpansion" id="178742" value="Splendor: Nobles Promo Tiles"/>
	<link type="boardgameexpansion" id="280452" value="Splendor: Nobles Promo Tiles"/>
	<link type="boardgameexpansion" id="190036" value="Splendor: Special Noble Patron Promo"/>
	<link type="boardgameexpansion" id="261074" value="Splendor: Thomas More Promo Noble"/>
	<link type="boardgameaccessory" id="193709" value="Splendor: AsmOPlay Gold Tokens"/>
	<link type="boardgameaccessory" id="337015" value="Splendor: Chilong and Nuwa Promo Tiles"/>
	<link type="boardgameaccessory" id="292898" value="Splendor: Cities of Splendor – Dice Con 2019 City Promo Tile"/>
	<link type="boardgameaccessory" id="272512" value="Splendor: Cities of Splendor – Splendid Cities Organizer"/>
	<link type="boardgameaccessory" id="346473" value="Splendor: Daiji and the Duke of Zhou Promo Tiles"/>
	<link type="boardgameaccessory" id="309478" value="Splendor: e-Raptor Insert"/>
	<link type="boardgameaccessory" id="337016" value="Splendor: Fuxi and the Yan Emperor Promo Tiles"/>
	<link type="boardgameaccessory" id="321502" value="Splendor: Greater China Tournament Prize Coins"/>
	<link type="boardgameaccessory" id="365990" value="Splendor: Hou Yi and Ji Fa Promo Tiles"/>
	<link type="boardgameaccessory" id="365991" value="Splendor: Jiang Ziya and Di Xin of Shang Promo Tiles"/>
	<link type="boardgameaccessory" id="403081" value="Splendor: LaserLand Acrylic Gems"/>
	<link type="boardgameaccessory" id="306398" value="Splendor: Laserox Gemstone Organizer"/>
	<link type="boardgameaccessory" id="184966" value="Splendor: Playmat"/>
	<link type="boardgameaccessory" id="401530" value="Splendor: Playmaty rubber mat"/>
	<link type="boardgameaccessory" id="268394" value="Splendor: Quick-Start Insert"/>
	<link type="boardgameaccessory" id="281008" value="Splendor: Space Cow Promo"/>
	<link type="boardgameaccessory" id="272769" value="Splendor: Splendid Game Chest"/>
	<link type="boardgameaccessory" id="348653" value="Splendor: The GiftForge Insert"/>
	<link type="boardgameaccessory" id="273589" value="Splendor: Tower Rex Organizer"/>
	<link type="boardgameaccessory" id="185398" value="Splendor: Translucent Gem Tokens"/>
	<link type="boardgameimplementation" id="364073" value="Splendor Duel"/>
	<link type="boardgameimplementation" id="293296" value="Splendor: Marvel"/>
	<link type="boardgameimplementation" id="406291" value="스플렌더: Pokémon (Splendor: Pokémon)"/>
	<link type="boardgamedesigner" id="50969" value="Marc André"/>
	<link type="boardgameartist" id="14878" value="Pascal Quidault"/>
	<link type="boardgamepublisher" id="25842" value="Space Cowboys"/>
	<link type="boardgamepublisher" id="15889" value="Asterion Press"/>
	<link type="boardgamepublisher" id="50230" value="Belleville (Бельвіль)"/>
	<link type="boardgamepublisher" id="43740" value="Board Game VN"/>
	<link type="boardgamepublisher" id="34501" value="Boardgame Space"/>
	<link type="boardgamepublisher" id="7162" value="Brain Games"/>
	<link type="boardgamepublisher" id="9068" value="Broadway Toys LTD"/>
	<link type="boardgamepublisher" id="50696" value="CoolPlay"/>
	<link type="boardgamepublisher" id="6784" value="Enigma (Bergsala Enigma)"/>
	<link type="boardgamepublisher" id="5657" value="Filosofia Éditions"/>
	<link type="boardgamepublisher" id="15605" value="Galápagos Jogos"/>
	<link type="boardgamepublisher" id="8820" value="Gém Klub Kft."/>
	<link type="boardgamepublisher" id="28415" value="GoKids 玩樂小子"/>
	<link type="boardgamepublisher" id="23382" value="HaKubia"/>
	<link type="boardgamepublisher" id="1391" value="Hobby Japan"/>
	<link type="boardgamepublisher" id="32569" value="JD Éditions"/>
	<link type="boardgamepublisher" id="6214" value="Kaissa Chess & Games"/>
	<link type="boardgamepublisher" id="8291" value="Korea Boardgames"/>
	<link type="boardgamepublisher" id="3218" value="Lautapelit.fi"/>
	<link type="boardgamepublisher" id="25203" value="Lex Games"/>
	<link type="boardgamepublisher" id="9325" value="Lifestyle Boardgames Ltd"/>
	<link type="boardgamepublisher" id="5787" value="Morapiaf"/>
	<link type="boardgamepublisher" id="32395" value="NeoTroy Games"/>
	<link type="boardgamepublisher" id="7466" value="Rebel Sp. z o.o."/>
	<link type="boardgamepublisher" id="33998" value="Siam Board Games"/>
	<link type="boardgamepublisher" id="538" value="Z-Man Games"/>
	<videos total="394">
		<video id="487764" title="Splendor - How to play" category="instructional" language="Serbian" link="http://www.youtube.com/watch?v=wlzpAIDC4hs" username="SAKY90" userid="3483845" postdate="2024-03-26T18:49:54-05:00"/>
		<video id="483572" title="How to Win Splendor - Strategy Tips from the World Series of Board Gaming" category="instructional" language="English" link="http://www.youtube.com/watch?v=lYIdqDcoPiA" username="ChrisCFGeorge" userid="2029481" postdate="2024-02-28T14:29:48-06:00"/>
		<video id="474079" title="Огляд від Здвинуті кубики" category="review" language="Ukrainian" link="http://www.youtube.com/watch?v=RONKm-1k7gw" username="punk_rock" userid="2986072" postdate="2024-01-07T05:00:16-06:00"/>
		<video id="468585" title="Steg för steg - Splendor" category="session" language="Swedish" link="http://www.youtube.com/watch?v=6EqMmKWf3Cc" username="Bitforbit" userid="2090566" postdate="2023-11-29T07:21:05-06:00"/>
		<video id="467623" title="Hướng Dẫn Chơi | Splendor | How to Play" category="instructional" language="Vietnamese" link="http://www.youtube.com/watch?v=L5mXNZSfbMQ" username="kienctn15" userid="1842339" postdate="2023-11-22T06:47:29-06:00"/>
		<video id="466671" title="みんなで遊ボードゲームLIVE　SPLENDOR 　宝石の煌き" category="session" language="Japanese" link="http://www.youtube.com/watch?v=D0jLlrVElH4" username="chezpierre2020" userid="3374512" postdate="2023-11-16T02:28:24-06:00"/>
		<video id="463584" title="How to Play Splendor | Complete Game Rules in 6 Minutes" category="instructional" language="English" link="http://www.youtube.com/watch?v=6Rk4nKEYrhY" username="GamePointTabletop" userid="3537467" postdate="2023-10-26T11:26:08-05:00"/>
		<video id="459525" title="I made Splender compact case" category="other" language="English" link="http://www.youtube.com/watch?v=FZ3HNYQNv4U" username="CoLabo" userid="2757607" postdate="2023-10-02T02:47:01-05:00"/>
		<video id="452885" title="Splendor - Board Game Rules - English" category="instructional" language="English" link="http://www.youtube.com/watch?v=LcsAmAuM5zA" username="Spacebase" userid="3221918" postdate="2023-08-22T09:30:48-05:00"/>
		<video id="451488" title="Splendor - Spielregeln - deutsch" category="instructional" language="German" link="http://www.youtube.com/watch?v=66dUSjxN8OI" username="Spacebase" userid="3221918" postdate="2023-08-12T16:31:59-05:00"/>
		<video id="451234" title="COMO JUGAR *SPLENDOR*" category="instructional" language="Spanish" link="http://www.youtube.com/watch?v=tUWv6wHZnA0" username="Mc_gregor14" userid="2500487" postdate="2023-08-10T17:11:17-05:00"/>
		<video id="450932" title="Знакомство с игрой" category="review" language="Russian" link="http://www.youtube.com/watch?v=poadWSIwTjc" username="snowbody" userid="201253" postdate="2023-08-09T02:25:48-05:00"/>
		<video id="450359" title="Розпаковка від Кубасик" category="unboxing" language="Ukrainian" link="http://www.youtube.com/watch?v=uGK_m9otDuA" username="punk_rock" userid="2986072" postdate="2023-08-06T08:44:45-05:00"/>
		<video id="449840" title="VORGESTELLT: Splendor (Space Cowboys/Asmodee)" category="review" language="German" link="http://www.youtube.com/watch?v=GUQpKLqSGjk" username="Gnislew" userid="196566" postdate="2023-08-03T10:21:47-05:00"/>
		<video id="446045" title="Огляд від Бельвіль" category="review" language="Ukrainian" link="http://www.youtube.com/watch?v=O5ja9OaTpIs" username="punk_rock" userid="2986072" postdate="2023-07-13T04:06:28-05:00"/>
	</videos>
	<statistics page="1">
		<ratings>
			<usersrated value="79378"/>
			<average value="7.42196"/>
			<bayesaverage value="7.30106"/>
			<ranks>
				<rank type="subtype" id="1" name="boardgame" friendlyname="Board Game Rank" value="215" bayesaverage="7.30106"/>
				<rank type="family" id="5499" name="familygames" friendlyname="Family Game Rank" value="49" bayesaverage="7.3001"/>
			</ranks>
			<stddev value="1.28948"/>
			<median value="0"/>
			<owned value="117282"/>
			<trading value="1030"/>
			<wanting value="806"/>
			<wishing value="9842"/>
			<numcomments value="11319"/>
			<numweights value="2650"/>
			<averageweight value="1.7819"/>
		</ratings>
	</statistics>
	<marketplacelistings>
		<listing>
			<listdate value="Fri, 03 Jul 2015 18:49:47 +0000"/>
			<price currency="EUR" value="29.05"/>
			<condition value="new"/>
			<notes value="weight: 1108 grams + packaging"/>
			<link href="https://boardgamegeek.com/market/product/762941" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Wed, 27 Jan 2016 04:01:38 +0000"/>
			<price currency="AUD" value="70.00"/>
			<condition value="new"/>
			<notes value="I live in Canberra. I am happy to meet up or I can post the game."/>
			<link href="https://boardgamegeek.com/market/product/876531" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 14 Mar 2017 21:19:12 +0000"/>
			<price currency="EUR" value="34.95"/>
			<condition value="new"/>
			<notes value="weight: 888 grams + packaging"/>
			<link href="https://boardgamegeek.com/market/product/1157010" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Wed, 22 Mar 2017 09:24:11 +0000"/>
			<price currency="EUR" value="22.00"/>
			<condition value="new"/>
			<notes value="Weight: 1.5kg&#10;You can calculate shipping cost here: http://www.posta.sk/m#pricelist&#10;(Please add Insurance on this page to calculate shipping cost according to item price. No additional hidden cost.)"/>
			<link href="https://boardgamegeek.com/market/product/1162925" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 07 Sep 2017 15:19:04 +0000"/>
			<price currency="USD" value="29.99"/>
			<condition value="new"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/1292793" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 09 Jan 2018 19:24:53 +0000"/>
			<price currency="USD" value="45.00"/>
			<condition value="new"/>
			<notes value="Please send geekmail for shipping cost. Will combine shipping for multiple items."/>
			<link href="https://boardgamegeek.com/market/product/1392588" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 18 Oct 2018 11:57:55 +0000"/>
			<price currency="USD" value="33.99"/>
			<condition value="new"/>
			<notes value="Stored on my shelf MT"/>
			<link href="https://boardgamegeek.com/market/product/1633171" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 22 Mar 2020 18:12:56 +0000"/>
			<price currency="USD" value="44.99"/>
			<condition value="new"/>
			<notes value="Still sealed in original shrink wrap. Shipping is calculated per order, with a range of about \$7-\$11 for one item in the continental United States.  Purchasing multiple items will garner a lower per-item shipping price."/>
			<link href="https://boardgamegeek.com/market/product/2108443" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 07 Jun 2020 03:58:04 +0000"/>
			<price currency="AUD" value="40.00"/>
			<condition value="new"/>
			<notes value="Brand new in shrinkwrap.&#10;&#10;Buyer pays for shipping (standard Australia Post shipping) or can pick up from Fairfield (Melbourne) VIC.&#10;&#10;Payment by PayPal or bank transfer"/>
			<link href="https://boardgamegeek.com/market/product/2172309" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sat, 13 Jun 2020 08:39:48 +0000"/>
			<price currency="AUD" value="70.00"/>
			<condition value="new"/>
			<notes value="Happy to ship anywhere via Sendle. Or pickup from North Melbourne. Prefer payment through website www.boardgameantics.com.au"/>
			<link href="https://boardgamegeek.com/market/product/2177479" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Fri, 31 Mar 2023 22:08:43 +0000"/>
			<price currency="USD" value="40.99"/>
			<condition value="new"/>
			<notes value="Shipping via USPS Flat Rate, UPS, or Local Pick up in store (343 S. Robertson Blvd, Beverly Hills, CA 90211) We are an online AND brick and mortar game shop located in the Los Angeles Area. The store is a labor of love between friends and brought to you by avid gamers. We TRULY appreciate your business! - Blue Gnome Games"/>
			<link href="https://boardgamegeek.com/market/product/2353911" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 10 Nov 2020 08:26:31 +0000"/>
			<price currency="EUR" value="29.50"/>
			<condition value="new"/>
			<notes value="Game weight: 1.100 kg"/>
			<link href="https://boardgamegeek.com/market/product/2368812" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sat, 13 Mar 2021 21:58:09 +0000"/>
			<price currency="USD" value="40.00"/>
			<condition value="new"/>
			<notes value="still sealed.  Venmo or zelle."/>
			<link href="https://boardgamegeek.com/market/product/2494190" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 06 Jul 2021 16:02:23 +0000"/>
			<price currency="EUR" value="29.90"/>
			<condition value="new"/>
			<notes value="Encomendas realizadas fora de Portugal (dentro da Europa), pagamento por: Paypal ou Transfer&#195;&#170;ncia Banc&#195;&#161;ria&#10;Encomendas realizadas em Portugal Continental e Ilhas, pagamento por: Paypal, Refer&#195;&#170;ncia Multibanco ou MB Way&#10;&#10;Orders placed outside Portugal (within Europe), payment by: Paypal or Bank Transfer&#10;Orders placed in Continental Portugal and Islands, payment by: Paypal, Multibanco Reference or MB Way"/>
			<link href="https://boardgamegeek.com/market/product/2589925" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 29 Jul 2021 18:20:01 +0000"/>
			<price currency="EUR" value="20.00"/>
			<condition value="likenew"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/2611225" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 28 Sep 2021 21:46:24 +0000"/>
			<price currency="EUR" value="30.00"/>
			<condition value="likenew"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/2657873" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 02 Jan 2022 02:59:19 +0000"/>
			<price currency="USD" value="30.00"/>
			<condition value="new"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/2745462" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 23 Jan 2022 05:17:24 +0000"/>
			<price currency="USD" value="30.00"/>
			<condition value="new"/>
			<notes value="NIS"/>
			<link href="https://boardgamegeek.com/market/product/2763937" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Mon, 24 Jan 2022 04:24:59 +0000"/>
			<price currency="USD" value="28.00"/>
			<condition value="new"/>
			<notes value="Game is new and in shrink wrap. &#10;Shipping is \$10 to US only.&#10;I will combine shipping with other game purchases."/>
			<link href="https://boardgamegeek.com/market/product/2764690" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sat, 26 Feb 2022 18:31:57 +0000"/>
			<price currency="EUR" value="25.00"/>
			<condition value="likenew"/>
			<notes value="***PROMO noble cards included***&#10;Played several times, but still in perfect condition.&#10;&#10;Shipping cost not included"/>
			<link href="https://boardgamegeek.com/market/product/2804465" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 15 Mar 2022 17:54:59 +0000"/>
			<price currency="EUR" value="30.49"/>
			<condition value="new"/>
			<notes value="New in shrink wrap.&#10;&#10;[size=14][b]All prices are inclusive of UK and EU VAT, but do not include shipping costs.[/b][/size] &#10;&#10;[size=12][b]Shipping Cost:[/b][/size] &#10;Shipping (with tracking) for this item will be:&#10;7 Euros within Germany.&#10;16 Euros to Luxemburg and Malta.&#10;17 Euros to Austria, Belgium, Bulgaria, Czech Republic, Cyprus, Estonia, France, Netherlands, Romania, and Switzerland. &#10;18 Euros to Albania, Belarus, Bosnia-Herzegovina, Iceland, Latvia, Lithuania, Montenegro, Norway, Serbia, and Spain.&#10;19 Ireland, Italy, Poland, Portugal, and Slovenia.&#10;20 Euros to Finland and Greece.&#10;21 Euros to Canada, Croatia, Denmark, Sweden, and USA.&#10;22 Euros to Australia, Brazil, China, Hungary, Indonesia, Israel, Japan, Malaysia, Mexico, New Zealand, Singapore, South Korea, Taiwan, Thailand, Turkey, and Vietnam.&#10;26 Euros to United Kingdom and everywhere else.&#10;&#10;NOTE: The shipping costs for deliveries outside of the EU and UK have been discounted to make up for the fact that no VAT is paid for sales outside of the EU and UK. However, there may be import taxes for deliveries outside of the EU and UK, and the buyer is responsible for paying these. &#10;&#10;&#10;[b]Combined Shipping:[/b]&#10;The shipping cost for multiple items will be:&#10;9 Euros within Germany.&#10;17 Euros to Switzerland.&#10;19 Euros to Luxemburg and Malta. &#10;20 Euros to Albania, Belarus, Bosnia and Herzegovina, Iceland, Montenegro, Norway, and Serbia.&#10;21 Euros to Cyprus and Romania.&#10;22 Euros to Austria, Bulgaria, Estonia, France, and Slovakia.&#10;23 Euros to Belgium, Czech Republic, Latvia, Lithuania, Netherlands, and Spain.&#10;24 Euros to Italy and Slovenia.&#10;26 Euros to Ireland, Poland, and Portugal.&#10;27 Euros to Finland and Greece.&#10;28 Euros to Israel and Turkey.&#10;29 Euros to Croatia, Denmark, and Sweden. &#10;31 Euros to Hungary.&#10;32 Euros to United Kingdom.&#10;46 Euros to China, Indonesia, Malaysia, Mexico, Singapore, South Korea, Taiwan, Thailand, and Vietnam.&#10;52 Euros to Canada and USA.&#10;55 Euros to Japan.&#10;60 Euros to Brazil.&#10;64 Euros to Australia, New Zealand, and everywhere else. &#10;&#10;[b]Mutiple Small Items:[/b] It may be possible to send multiple small items for cheaper than the above rate. If you are wondering about this possibility, please send me a message.  &#10;&#10;&#10;[size=14][b]Payment Options:[/b][/size] &#10;&#10;[size=12][b]Paypal:[/b][/size] No fee is charged to you, if you pay using Paypal. But Paypal does not change currency at the fair market rate. So you will lose 3% or more of your money, if you are converting to Euros.&#10;&#10;[size=12][b]IBAN Bank Transfer:[/b][/size] Payment by bank transfer is possible using an IBAN compatible account. [b]There is a 3% discount if you pay using IBAN Bank Transfer[/b] (i.e., your total payment due is 3% less). &#10;&#10;[size=12][b]Wise:[/b][/size] There is a 3% discount if you pay using Wise (i.e., your total payment due is 3% less). The company does currency conversion at the fair market rate, and charges the sender a fee of about 0.5% of the amount of money sent.&#10;&#10;[size=12][b]Revolut:[/b][/size] There is a 3% discount if you pay using Revolut (i.e., your total payment due is 3% less). The company does currency conversion at the fair market rate, and there are no fees to send money. &#10;&#10;[size=12][b]Interac e-transfer:[/b][/size] If you have a Canadian bank account (like me), then you can pay by Interac e-transfer. In this case, you pay in Canadian dollars, at the fair market exchange rate. There is also a 3% discount, if you pay using Interac e-transfer (i.e., your total payment due is 3% less).&#10;&#10;[size=12][b]Payment in Dollars:[/b][/size] It is possible to make Paypal payments in US or Canadian dollars, at the fair market exchange rate. You will automatically receive this option, if your address is in the USA or Canada.&#10;&#10;&#10;[size=14][b]I take responsibility for the safe delivery of your order:[/b][/size] I am a registered commercial seller. Thus, insofar as you are a private consumer, it is required by German law that I take responsibility for any loss or damage of goods that occurs during shipment.&#10;&#10;&#10;[size=14][b]Looking for something that is not listed here?[/b][/size] &#10;I also sell smaller items on BGG here:&#10;https://boardgamegeek.com/geekmarket/user/Eurosopa_major?pageid=1&#10;&#10;If you want to combine items from my other alias, let me know. The flat rate shipping offered there does not apply to the items listed here. The items sold there will typically (but not always) ship for free with the items sold here.&#10;&#10;I can also make [size=12][b]special orders[/b][/size] for items that I don't have in stock. Send me a message concerning an item, and I will check for availability and tell you what the price would be."/>
			<link href="https://boardgamegeek.com/market/product/2818435" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Mon, 04 Apr 2022 17:23:45 +0000"/>
			<price currency="EUR" value="33.00"/>
			<condition value="new"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/2833817" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sat, 09 Apr 2022 21:55:59 +0000"/>
			<price currency="USD" value="40.00"/>
			<condition value="new"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/2837845" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 21 Jul 2022 22:38:40 +0000"/>
			<price currency="USD" value="35.00"/>
			<condition value="likenew"/>
			<notes value="Excellent condition; shrinkwrap removed, but game has never been played."/>
			<link href="https://boardgamegeek.com/market/product/2919243" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Wed, 07 Sep 2022 02:00:45 +0000"/>
			<price currency="USD" value="25.00"/>
			<condition value="new"/>
			<notes value="Brand new. Shrink wrapped."/>
			<link href="https://boardgamegeek.com/market/product/2955005" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 18 Sep 2022 18:21:14 +0000"/>
			<price currency="USD" value="17.00"/>
			<condition value="verygood"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/2963077" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 11 Oct 2022 14:52:38 +0000"/>
			<price currency="EUR" value="24.00"/>
			<condition value="likenew"/>
			<notes value="French version of Splendor, hand delivery preferable"/>
			<link href="https://boardgamegeek.com/market/product/2984475" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 11 Oct 2022 18:07:08 +0000"/>
			<price currency="USD" value="20.00"/>
			<condition value="likenew"/>
			<notes value="Played once in great condition"/>
			<link href="https://boardgamegeek.com/market/product/2984719" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Wed, 12 Oct 2022 09:36:19 +0000"/>
			<price currency="EUR" value="22.00"/>
			<condition value="verygood"/>
			<notes value="hand delivery preferable"/>
			<link href="https://boardgamegeek.com/market/product/2985168" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sat, 26 Nov 2022 08:28:54 +0000"/>
			<price currency="USD" value="39.00"/>
			<condition value="new"/>
			<notes value="Can ship/pickup from US too. &#10;&#10;I also accept email money transfer. (Canada Only)&#10;&#10;I can bring it across the border and ship it from the US too.  US Personal Checks are fine too. &#10;&#10;Shipping charges will be actual.  (No more than \$16)&#10;&#10;Just a reminder prices are in US dollars as shown.&#10;&#10;Pickups okay Near Toronto in Ancaster, ON or North of Buffalo NY. (Pendleton/Lockport, NY) Cash on pickup is fine."/>
			<link href="https://boardgamegeek.com/market/product/3024271" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sat, 07 Jan 2023 12:11:02 +0000"/>
			<price currency="USD" value="75.00"/>
			<condition value="verygood"/>
			<notes value="This ad is for both the Game &quot;Splendor&quot; and it's expansion &quot;Cities of Splendor&quot;. Some key points for mentioning are:&#10;&#9;&#10;1. Main game & the Cities Expansion are arranged neatly in a single box of &quot;Splendor: Cities of Splendor&quot; and are available for sale together only.&#10;2. The game has only hit the table around 3-4 times and is as good as new. &#10;3. All the cards are sleeved."/>
			<link href="https://boardgamegeek.com/market/product/3060397" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 17 Jan 2023 15:29:50 +0000"/>
			<price currency="EUR" value="25.00"/>
			<condition value="likenew"/>
			<notes value="New, factory sealed with small damage at the box.&#10;Neuware, original eingeschwei&#195;&#159;t, mit leichtem Lagerschaden.&#10;&#10;Shipment germany: 5,-&#226;&#130;&#172;&#10;Shipment EU: 12,50&#226;&#130;&#172;&#10;Shipment world: please ask&#10;&#10;Safe shipment and take a look at my other games and promos.&#10;&#10;---&#10;Roland Berberich&#10;- Alles f&#195;&#188;r den Helden -&#10;Friedensstrasse 1&#10;63927 B&#195;&#188;rgstadt&#10;VAT: DE281669854&#10;---&#10;ODR-Verordnung&#10;&#10;Aus rechtlichen Gr&#195;&#188;nden m&#195;&#188;ssen wir unsere Kunden darauf hinweisen, dass es eine Online-Plattform auf EU-Ebene zur Beilegung von RechtsstreitigkeitenimOnlinehandel gibt. Sie finden diese aufhttp://ec.europa.eu/consumers/odr"/>
			<link href="https://boardgamegeek.com/market/product/3068418" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 09 Feb 2023 16:35:25 +0000"/>
			<price currency="USD" value="21.99"/>
			<condition value="new"/>
			<notes value="CLS Games - Atlanta's Board Game Warehouse - is the largest retailer of board games in metro Atlanta! All games are new & still in factory shrink-wrap.&#10;&#10;SPLENDOR: \$21.99&#10;Asmodee Editions [ASM SPL01]&#10;* 2015 Edition with the heavier weight chips.&#10;&#10;SHIPPING&#10;Continental U.S. - \$14.95&#10;International (Including AK & HI) - TBD"/>
			<link href="https://boardgamegeek.com/market/product/3086077" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Fri, 10 Mar 2023 03:06:47 +0000"/>
			<price currency="USD" value="20.00"/>
			<condition value="verygood"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/3115961" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Mon, 03 Apr 2023 02:51:05 +0000"/>
			<price currency="USD" value="35.00"/>
			<condition value="new"/>
			<notes value="Sealed.&#10;&#10;Buyer pays shipping."/>
			<link href="https://boardgamegeek.com/market/product/3133225" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 09 May 2023 19:19:43 +0000"/>
			<price currency="USD" value="28.00"/>
			<condition value="likenew"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/3165261" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Fri, 14 Jul 2023 17:33:44 +0000"/>
			<price currency="USD" value="10.00"/>
			<condition value="good"/>
			<notes value="Box has noticeable wear but all components are in good condition"/>
			<link href="https://boardgamegeek.com/market/product/3209812" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Wed, 26 Jul 2023 20:01:32 +0000"/>
			<price currency="USD" value="38.00"/>
			<condition value="new"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/3224829" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 30 Jul 2023 11:01:50 +0000"/>
			<price currency="EUR" value="25.00"/>
			<condition value="new"/>
			<notes value="Sealed box"/>
			<link href="https://boardgamegeek.com/market/product/3227034" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 29 Aug 2023 19:07:35 +0000"/>
			<price currency="USD" value="45.00"/>
			<condition value="new"/>
			<notes value="Please send us a message or call Family Game Knight at 1-681-238-5740 to complete your purchase! We'd be happy to take care of you! Shipping varies depending on item and location and will be calculated before checkout. International shipping available as well."/>
			<link href="https://boardgamegeek.com/market/product/3249507" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 03 Oct 2023 17:33:32 +0000"/>
			<price currency="USD" value="45.00"/>
			<condition value="new"/>
			<notes value="New in Shrink&#10;Includes:&#10;[thing=220653][/thing] - also New in Shrink"/>
			<link href="https://boardgamegeek.com/market/product/3274281" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 22 Oct 2023 11:57:56 +0000"/>
			<price currency="EUR" value="35.00"/>
			<condition value="verygood"/>
			<notes value="English edition. Everything in great condition. Includes the Cities of Splendor expansion and The Nobles promo. NOTE: All base game and expansion contents are stored in the Cities of Splendor expansion box, rather than the base game box. I liked the cover of the expansion box better. :) Photos available upon request (please send me your email address when requesting them). Shipping via DHL or PostNL at the cost and risk of the buyer. Pickup possible (Stadsregio Arnhem-Nijmegen). Please check my other items for the possibility of combined shipping. Thank you for looking at this listing!"/>
			<link href="https://boardgamegeek.com/market/product/3288186" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 26 Oct 2023 21:33:58 +0000"/>
			<price currency="EUR" value="19.00"/>
			<condition value="likenew"/>
			<notes value=""/>
			<link href="https://boardgamegeek.com/market/product/3292229" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Fri, 10 Nov 2023 06:20:02 +0000"/>
			<price currency="USD" value="15.00"/>
			<condition value="verygood"/>
			<notes value="Played a few times, but still in very good condition."/>
			<link href="https://boardgamegeek.com/market/product/3303930" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 21 Nov 2023 21:31:24 +0000"/>
			<price currency="USD" value="20.00"/>
			<condition value="new"/>
			<notes value="From our brick and mortar location in South Haven mi&#10;shipping \$10 - \$15."/>
			<link href="https://boardgamegeek.com/market/product/3320663" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Mon, 11 Dec 2023 12:21:11 +0000"/>
			<price currency="GBP" value="18.00"/>
			<condition value="new"/>
			<notes value="New in shrink.  Shipping in UK &#194;&#163;3.49 Royal Mail 2nd class.&#10;Tiny tear to shrinkwrap, with no effect on the box."/>
			<link href="https://boardgamegeek.com/market/product/3335890" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 14 Dec 2023 14:41:29 +0000"/>
			<price currency="USD" value="19.00"/>
			<condition value="new"/>
			<notes value="New. Still in original wrapping. Never been opened.&#10;&#10;Selling from Mishawaka, Indiana (46545), please contact jeremywilmot12@gmail.com to discuss payment and shipping (PayPal is preferred but willing to discuss other methods). Listed price does not include shipping. Can also arrange pickup if that is preferred.&#10;&#10;Check out my other listings as well &gt; https://boardgamegeek.com/market/user/jwilmo?pageid=1"/>
			<link href="https://boardgamegeek.com/market/product/3337904" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Thu, 28 Dec 2023 17:28:40 +0000"/>
			<price currency="USD" value="17.00"/>
			<condition value="new"/>
			<notes value="new in shrink.  fits in a flat rate usps priority box so ships for \$14.75 (actual cost)"/>
			<link href="https://boardgamegeek.com/market/product/3345972" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Tue, 16 Jan 2024 16:23:04 +0000"/>
			<price currency="USD" value="30.00"/>
			<condition value="verygood"/>
			<notes value="Includes both Splendor and Cities Expansion"/>
			<link href="https://boardgamegeek.com/market/product/3365959" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Mon, 12 Feb 2024 19:52:18 +0000"/>
			<price currency="USD" value="35.00"/>
			<condition value="likenew"/>
			<notes value="Includes &#9;&#10;Splendor &#226;&#128;&#144; English first edition (2013), &#10;Splendor: Cities of Splendor (2017), &#10;Splendor: Special Noble Patron Promo (2015), &#10;Splendor: Nobles Promo Tiles (2015),&#10;Splendor: Cities of Splendor &#226;&#128;&#147; Splendid Cities Organizer (2018)"/>
			<link href="https://boardgamegeek.com/market/product/3387443" title="marketlisting"/>
		</listing>
		<listing>
			<listdate value="Sun, 24 Mar 2024 14:55:14 +0000"/>
			<price currency="USD" value="15.00"/>
			<condition value="verygood"/>
			<notes value="Game is in very good condition and has only been played a few times.&#10;&#10;Buyer pays shipping from 48116. I ship via Pirate Ship to help save on shipping, and I'm also willing to combine games.&#10;&#10;I accept PayPal or Venmo. Let me know if you have any questions!"/>
			<link href="https://boardgamegeek.com/market/product/3418046" title="marketlisting"/>
		</listing>
	</marketplacelistings>
</item>''';
    final document = XmlDocument.parse(xml);
    final decoder = BoardGameDecoder();
    var boardGame = decoder.decode(document.rootElement);

    expect(boardGame.id, equals(148228));
    expect(boardGame.name, equals('Splendor'));
    expect(boardGame.yearPublished, equals(2014));
    expect(boardGame.minAge, equals(10));
    expect(boardGame.minPlayers, equals(2));
    expect(boardGame.maxPlayers, equals(4));
    expect(boardGame.minPlayTime, equals(30));
    expect(boardGame.maxPlayTime, equals(30));
    expect(boardGame.playingTime, equals(30));
    expect(
        boardGame.description,
        equals(
            "Splendor is a game of chip-collecting and card development. Players are merchants of the Renaissance trying to buy gem mines, means of transportation, shops—all in order to acquire the most prestige points. If you're wealthy enough, you might even receive a visit from a noble at some point, which of course will further increase your prestige.\n\n"));
    expect(
        boardGame.thumbnail,
        equals(Uri.parse(
            'https://cf.geekdo-images.com/thumb/img/D4hkkHfOgu22PwgJomjplWAveuo=/fit-in/200x150/pic1904079.jpg')));
    expect(
        boardGame.image,
        equals(Uri.parse(
            'https://cf.geekdo-images.com/original/img/PgaVULm0QKeFV2zTro4hJEb70Yk=/0x0/pic1904079.jpg')));
    expect(boardGame.boardGameDesigner.length, equals(1));
    expect(boardGame.boardGameArtist.length, equals(1));
    expect(boardGame.boardGamePublisher.length, equals(26));
    expect(boardGame.videos.length, equals(15));
    expect(boardGame.videos[0].id, equals(483572));
    expect(
        boardGame.videos[0].title,
        equals(
            'How to Win Splendor - Strategy Tips from the World Series of Board Gaming'));
    expect(
        boardGame.names,
        equals([
          'Splendor',
          'Розкіш',
          'Роскошь',
          'ספלנדור',
          'جواهري',
          'เกมค้าเพชร',
          '宝石の煌き',
          '璀璨宝石',
          '璀璨寶石',
          '스플렌더'
        ]));
  });
}
