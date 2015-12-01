//Create elementary cellualer 


String gen = "";
int rule = 126;  //Change this to any number from 0 to 255 for a different pattern!
int row = 0;

String neighbors(String gen, int i) {
  if (i == 0)
    return '0' + gen.substring(0, 2);
  else if (i == gen.length() - 1)
    return gen.substring(gen.length() - 2, gen.length()) + '0';
  else
    return gen.substring(i - 1, i + 2);
}

String eval_rule(String neighborhood, int rule) {
  int bit_num = Integer.parseInt(neighborhood, 2);
  String rule_val = ((rule & 1 << bit_num) == 0) ? "0": "1";
  return rule_val;
}

String next_generation(String gen, int rule) {
  String next = "";
  for (int i = 0; i < gen.length(); i++) {
    String neighborhood = neighbors(gen, i);
    next += eval_rule(neighborhood, rule);
  }
  return next;
}

void draw_generation(String gen) {
  for (int i = 0; i < gen.length(); i++) {
    if (gen.charAt(i) == '1')
      point(i, row);
  }
  row++;
}


void setup() {
  size(640, 480);
  background(0, 0, 32);
  stroke(255, 255, 128);
  
  for (int i = 0; i < 640; i++) {
    if (i == 320)
    //if (i % 200 == 0)
      gen += "1";
    else
      gen += "0";
  }
}

void draw() {
  if (row < 481) {
    draw_generation(gen);
    gen = next_generation(gen, rule);
  }
}