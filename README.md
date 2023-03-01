#  Hello API App

Flutter (3.3.3)

## Details


### posts.dart

- PostsModel From https://javiercbk.github.io/json_to_dart/
- Initiated a List to Store data from API.
- Under If/Else Created for loop to add data in that list.
- return postsList;

- Text(postsList[i].title.toString()),  // i is the index


### photos.dart

- Created a custom Model. 
- Initiated a List to Store data from API.
- Under If/Else Created for loop to add data in that list.
  PhotosModel photos = PhotosModel(id: i['id'],....);
  photosList.add(photos);


### users.dart

- UsersModel From https://javiercbk.github.io/json_to_dart/
- Initiated a List to Store data from API.
- Under If/Else Created for loop to add data in that list.
- It Has Nested Objects
 


### users_woModel.dart

- Fetched data from API without Model.
- initiated var data;
- Future with void return type.
- under if/else jsonDecoded in data.
- for loop is not used.
- return data.

- Text(data[i]['address']['city']), 

### all_data.dart

- AllDataModel From https://javiercbk.github.io/json_to_dart/
- Not creating list coz API starts as an object.
- Fetching data through model list.
- It has nested list and objects.
- For every list use ListView.builder under Expanded/SizedBox/Container.
- use physics : BouncingScrollPhysics(),
- Futue<AllDataModel>
- Under If/Else return AllDataModel.fromJson(data)

1st ListView:
  snapshot.data!.data![data_i].shop!.description.toString(),

2nd ListView:
  snapshot.data!.data![data_i].images![images_i].url.toString()

- under 1st listView before return (for Repetition)

final _data = snapshot.data!.data![data_i];

### Theme Colors:
  -  Declared in Constants

## Demonstration:
 
<!-- <img height="600px" width="300px" src="" />  -->


<!-- ## Result Screen -->

<br/>

## Credits

 ### [Shahab Alam](#) <br/><br/>

 ### Follow


<a  href="https://www.facebook.com/iamShahabAlam/">

<img  align="left"  alt="Facebook"  width="22px"  src="https://www.facebook.com/images/fb_icon_325x325.png" />

</a>


<a href="https://github.com/IamShahabAlam">
 <img  align = "left" src="https://cdn-icons-png.flaticon.com/512/919/919847.png"  width="22px"  alt="GitHub Icon"></a>



<a  href="https://twitter.com/IamShahabAlam">

<img  align="left"  alt="Twitter"  width="22px"  src="https://cdn-icons-png.flaticon.com/512/1409/1409937.png" />

</a>

<a  href="https://www.linkedin.com/in/iamshahabalam">

<img  align="left"  alt="LinkedIn"  width="24px"  src="https://cdn-icons-png.flaticon.com/512/1377/1377213.png" />

</a>

<a  href="mailto:IamshahabAlam@gmail.com">

<img  align="left"  alt="Gmail"  width="22px"  src="https://img.icons8.com/fluency/256/gmail-new.png" />

</a>

<a  href="https://medium.com/@iamshahabalam">
<img  align="left"  alt="Medium"  width="25px"  src="https://img.icons8.com/fluency/344/medium-logo.png" /></a>


<a  href="https://dev.to/iamshahabalam">
<img  align="left"  alt="DEV"  width="25px"  src="https://d2fltix0v2e0sb.cloudfront.net/dev-black.png" /></a>


<br/>

&nbsp;


<p align='left'>
<img height="50" src="https://user-images.githubusercontent.com/82330891/203849226-b396561a-3ab1-4d80-85b1-e3accd07008c.gif"  frameBorder="10" class="giphy-embed" allowFullScreen></img> </p>
            

<!-- > :blue_heart: &nbsp; Fluttering -->