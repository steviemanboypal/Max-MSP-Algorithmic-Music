//declare all global variables outside the functions at the start of the program

int cols, rows;
int scl = 20;
int w = 1600;
int h = 2000;
float flying = 0;
int light = 255;
int red = 255;
int green = 255;
int blue = 255;
PImage windy;
PImage rain;
PImage sunny;
PImage snow;
PImage storm;
PImage cloudy;
PImage cold;
int temperature = 0;
int code = 0;
String weather = "";

//create array
float[][] terrain;

void setup(){
  //Call P3D in size
 size(600, 600, P3D); 
 
 // The URL for the XML document
  String url = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(561536)%20where%20text%3D%22nome%2C%20ak%22)&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";

  // Load the XML document
  XML xml = loadXML(url);

  // Grab the element we want
  XML forecast = xml.getChild("results/channel/item/yweather:forecast");

  // Get the attributes we want
  temperature = forecast.getInt("high");
  weather = forecast.getString("text");
  code = forecast.getInt("code");
 
 //load different background images and set them to PImage variables
 windy = loadImage("windy.jpg");
 rain = loadImage("rain.jpg");
 sunny = loadImage("sunny.jpg");
 snow = loadImage("snow.jpg");
 storm = loadImage("stormy.jpg");
 cloudy = loadImage("cloudy.jpg");
 cold = loadImage("cold.jpg");

 
 cols = w/ scl;
 rows = h / scl;
 terrain = new float[cols][rows];
 
}
void draw() {
  //background(121, 245, 255);
  
  //if statements to create different visuals based on the weather
  
  if((code <= 30 && code >= 26) || code == 44)
  {
    image(cloudy, 0, 0, width, cloudy.height);
    //create ellipse that changes colour based on temp and contains temp and weather details
    ellipseMode(CORNERS);
    fill(255, 255 - (temperature * 2), 255 - (temperature * 2));
    ellipse(width/10 * 7.5, height / 10 + 20, width/10 * 9.5, height / 20 - 15);
    textSize(32);
    fill(0);
    text(temperature + "°F", width/10 * 8 - 10, height / 10 - 5);
    textSize(10);
    text(weather, width/10 * 8 - 5, height / 10 + 5);
  
    fill(21, 80, 40);
  }
  else if(code == 23 || code == 24)
  {
    image(windy, 0, 0, width, windy.height);
    ellipseMode(CORNERS);
    fill(255, 255 - (temperature * 2), 255 - (temperature * 2));
    ellipse(width/10 * 7.5, height / 10 + 20, width/10 * 9.5, height / 20 - 15);
    textSize(32);
    fill(0);
    text(temperature + "°F", width/10 * 8 - 10, height / 10 - 5);
    textSize(10);
    text(weather, width/10 * 8 - 5, height / 10 + 5);
    fill(21, 90, 40);
  }
  else if(code <= 4 || (code <= 39 && code >= 37) || (code == 45 || code == 47) )
  {
    image(storm, 0, 0, width, storm.height);
    ellipseMode(CORNERS);
    fill(255, 255 - (temperature * 2), 255 - (temperature * 2));
    ellipse(width/10 * 7.5, height / 10 + 20, width/10 * 9.5, height / 20 - 15);
    textSize(32);
    fill(0);
    text(temperature + "°F", width/10 * 8 - 10, height / 10 - 5);
    textSize(10);
    text(weather, width/10 * 8 - 5, height / 10 + 5);
    fill(21, 80, 60);
  }
  else if((code == 36) || (code >= 31 && code <= 34))
  {
    image(sunny, 0, 0, width, sunny.height);
    ellipseMode(CORNERS);
    fill(255, 255 - (temperature * 2), 255 - (temperature * 2));
    ellipse(width/10 * 7.5, height / 10 + 20, width/10 * 9.5, height / 20 - 15);
    textSize(32);
    fill(0);
    text(temperature + "°F", width/10 * 8 - 10, height / 10 - 5);
    textSize(10);
    text(weather, width/10 * 8 - 5, height / 10 + 5);
    fill(50, 73, 40);
  }
  else if(code == 7 || (code >= 13 && code <= 18) || (code >= 41 && code <= 43) || code == 46)
  {
    image(snow, 0, 0, width, snow.height);
    ellipseMode(CORNERS);
    fill(255, 255 - (temperature * 2), 255 - (temperature * 2));
    ellipse(width/10 * 7.5, height / 10 + 20, width/10 * 9.5, height / 20 - 15);
    textSize(32);
    fill(0);
    text(temperature + "°F", width/10 * 8 - 10, height / 10 - 5);
    textSize(10);
    text(weather, width/10 * 8 - 5, height / 10 + 5);
    fill(180, 180, 180);
  }
  else if (code == 5 || code == 6 || (code >= 8 && code <= 12) || code == 35 || code == 40 )
  {
    image(rain, 0, 0, width, rain.height);
    ellipseMode(CORNERS);
    fill(255, 255 - (temperature * 2), 255 - (temperature * 2));
    ellipse(width/10 * 7.5, height / 10 + 20, width/10 * 9.5, height / 20 - 15);
    textSize(32);
    fill(0);
    text(temperature + "°F", width/10 * 8 - 10, height / 10 - 5);
    textSize(10);
    text(weather, width/10 * 8 - 5, height / 10 + 5);
    fill(21, 80, 50);
  }
  else
  {
    image(cold, 0, 0, width, cold.height);
    ellipseMode(CORNERS);
    fill(255, 255 - (temperature * 2), 255 - (temperature * 2));
    ellipse(width/10 * 7.5, height / 10 + 20, width/10 * 9.5, height / 20 - 15);
    textSize(32);
    fill(0);
    text(temperature + "°F", width/10 * 8 - 10, height / 10 - 5);
    textSize(10);
    text(weather, width/10 * 8 - 5, height / 10 + 5);
    fill(21, 80, 34);
  }
  //println(weather);
  noStroke();
  //fill(21, 90, 40);
  
  //lights to make 3D surface more realistic
directionalLight(red, green, blue, 0, 0, -1);
  spotLight(255, 102, 126, w/2, 20, 40, 0, 0, -1, PI/2, 2);
ambientLight(light, light, light);


  //we need to create the illusion of flying
  //this means moving over the noise 
  //to do this we need to shift the noise downwards quickly 
  flying -= 0.1;
  float yoff = flying; //these offsets are much better inputs for the noise algorithm 
 for(int y = 0; y < rows; y++){
   float xoff = 0;
     for (int x = 0; x < cols; x++){
       terrain[x][y] = map(noise(xoff, yoff), 0, 1, -50, 50);
       xoff += 0.1;
  }
  yoff += 0.1;
 }
  
  //tilt the 3d surface to show it's 3d
  translate(width/2, height/2, 250);
  rotateX((PI/2.5)); //180/3 = 60
  translate(-w/2, -h/2);
    
      //creates the surface
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP); // start new shape for every row
     for (int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]); //step down and add a vertex
    }
    endShape();
  }
}