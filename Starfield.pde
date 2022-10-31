ArrayList<Particle> particles;
void setup() {
  size(1000, 1000);
  particles = new ArrayList<Particle>();
  background(0);
}
void draw() {
  noStroke();
  fill(0, 0, 0, 25);
  rect(0, 0, 1000, 1000);
  fill(255, 255, 255);
  ArrayList<Particle> shortenedParticles = new ArrayList<Particle>();
  int maxDistance = 707;
  for (Particle particle : particles) {
    particle.move();
    particle.show();
    if (distanceBetween(500, 500, particle.getX(), particle.getY())<maxDistance) {
      shortenedParticles.add(particle);
    }
  }
  particles = shortenedParticles;
}

void mousePressed() {
  int amountOfParticles = 20;
  for (int i = 0; i<amountOfParticles; i++)
    particles.add(new Particle(mouseX, mouseY, rand(1, 360), rand(5, 10), new int[]{(int)rand(0, 255), (int)rand(0, 255), (int)rand(0, 255)}));
  particles.add(new OddballParticle(mouseX, mouseY, rand(1, 360), rand(5, 10), new int[]{(int)rand(0, 255), (int)rand(0, 255), (int)rand(0, 255)}));
}



double rand(int start, int end) {
  return((Math.random()*(difference(start, end)+1))+start);
}

double difference(double a, double b) {
  return(Math.abs(a-b));
}

double distanceBetween(double x1, double y1, double x2, double y2) {
  return(Math.sqrt(Math.pow(difference(x1, x2), 2) + Math.pow(difference(y1, y2), 2)));
}



class Particle {
  double x, y, angle, speed;
  int[] rgb;
  Particle(double x, double y, double angle, double speed, int[] rgb) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.speed = speed;
    this.rgb = rgb;
  }

  void show() {
    fill(rgb[0], rgb[1], rgb[2]);
    ellipse((float)x, (float)y, 10, 10);
  }

  void move() {
    x += Math.cos(radians((float)angle))*speed;
    y += Math.sin(radians((float)angle))*speed;
  }

  double getX() {
    return x;
  }

  double getY() {
    return y;
  }
}

class OddballParticle extends Particle {
  OddballParticle(double x, double y, double angle, double speed, int[] rgb) {
    super(x, y, angle, speed, rgb);
  }
  void move() {
    angle+=8.5;
    speed+=0.3;
    super.move();
  }
  void show() {
    fill(rgb[0], rgb[1], rgb[2]);
    ellipse((float)x, (float)y, 25, 25);
  }
}
