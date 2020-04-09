//int length = 50;
float header_height = displayHeight/8;
float submit_height = displayHeight/8;
float indent = displayWidth/16;


 


String[] ingredients = {"Aata", "Rice", "Potatoes", "Dal", "Capsicum", "Beans", "Carrots", "Mao", "Paneer", "Soya nuggets", "Bhindi", "Rajma", "Chhole", "Gobi", "Lauki", "Cabbage", "Parval", "Spinach", "Peas", "Lobia", "Brinjal", "Onions", "Corn" ,"Besan", "White bread", "Tomatoes"};

String[] dishes = {"Aloo ki sabzi", "Aloo capsicum", "Aloo peas", "Aloo paneer", "Aloo beans", "Aloo gobi", "Aloo parval", "Aloo capsicum paneer", "Aloo capsicum peas", "Aloo capsicum peas paneer", "Aloo capsicum peas paneer soya nuggets", "Aloo peas gobi", "Aloo peas paneer", "Gobi", "Lauki", "Lauki with dal", "Cabbage", "Lobia", "Spinach with corn", "Paneer", "Chhole", "Bhindi", "Brinjal bharta", "Dal", "Dal with saag", "Rice and dal", "Uthappam", "Aloo paratha", "Paneer paratha", "Dal ka paratha", "Dal baati", "Rajma chawal", "Choori", "Pyaaz ka paratha", "Dosa", "Gatte", "Idli", "Appam", "Poori", "Club sandwich"};

String[] Khushi = {"Aloo ki sabzi","Aloo paneer","Aloo capsicum paneer","Aloo peas paneer","Paneer","Chhole","Dal","Rice and dal","Uthappam","Aloo paratha","Paneer paratha", "Dal ka paratha","Dal baati","Rajma chawal","Choori","Pyaaz ka paratha", "Dosa","Gatte","Idli","Appam","Poori","Club sandwich"};

String[] Vibhu = {"Aloo gobi","Aloo peas gobi","Gobi","Lauki","Spinach with corn"};
          
String[][] components = {{"Potatoes"},{"Potatoes","Capsicum"},{"Potatoes","Peas"},{"Potatoes","Paneer"},{"Potatoes","Beans"},{"Potatoes","Gobi"},{"Potatoes","Parval"},{"Potatoes","Capsicum","Paneer"},{"Potatoes","Capsicum","Peas"},{"Potatoes","Capsicum","Peas","Panner"},{"Potatoes","Capsicum","Peas","Paneer","Soya nuggets"},{"Potatoes","Peas","Gobi"},{"Potatoes","Peas","Paneer"},{"Gobi"},{"Lauki"},{"Lauki","Dal"},{"Cabbage"},{"Lobia"},{"Spinach","Corn"},{"Paneer"},{"Chhole"},{"Bhindi"},{"Brinjal"},{"Dal"},{"Dal","Spinach"},{"Rice","Dal"},{"Mao","Tomatoes","Capsicum","Carrots"},{"Aata","Aloo"},{"Aloo","Paneer"},{"Aata","Dal"},{"Aata","Dal"},{"Rajma","Rice"},{"Aata"},{"Aata","Onions"},{"Mao","Dal"},{"Besan"},{"Mao"},{"Mao","Tomatoes","Capsicum","Carrots"},{"Aata"},{"Bread","Tomatoes"}};

Checkbox[] boxes = new Checkbox[ingredients.length];

float box_size = (ingredients.length + 1)/(0.75 * displayHeight);


class Checkbox {
  float x, y;
  
  boolean checked;
  
  Checkbox(float _x, float _y){
    x = _x;
    y = _y;
    checked = false;
  }
  void render(){
    stroke(255);
    
    if(checked){
      fill(52, 180, 235);
    } else {
      fill(0,0,0); 
    }
    println("test");
    rect(x, y, box_size, box_size, 5);
  }
  void click(){
    if(isOver()){
      checked =! checked;
    }
  }
  boolean isOver(){
    return(mouseX > x && mouseX < x + box_size && mouseY > y && mouseY < y + box_size);
  }
}
 
void setup(){
  size(displayWidth,displayHeight);
  smooth();
  println(ingredients.length);
  for(int i=0; i< boxes.length; i++){
    if(i < floor(boxes.length / 2)){
      boxes[i] = new Checkbox(indent, box_size * (2*i + 1));
    } else {
      boxes[i] = new Checkbox((displayWidth/2 + box_size), box_size * (2*(i - floor(boxes.length / 2)) + 1));
    }
   }
  }

 
void draw(){
  background(0);
  boolean allChecked = true;
  for(int i=0; i< boxes.length; i++){
    boxes[i].render();
    if(!boxes[i].checked){
      allChecked = false;
    }
  }
  if(allChecked){
    stroke(255);
    line(10,40,90,40);
    stroke(255,0,0);
    point(random(10,90), 40);
  }
}
 
void mousePressed(){
  for(int i=0; i< boxes.length; i++){
    boxes[i].click();
  }
}
