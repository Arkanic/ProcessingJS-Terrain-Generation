// Terrain generator v0.4
// By tal0s (Arkanic on GitHub)
//
// NOTE:
// ProcessingJS's noiseSeed() function does not work. for this reason I have to add a random "seed" number
// to the current noise position variables. otherwise we end up with the same map every time....
// feel free to fork/ctrl+c & v.
size(window.innerWidth, window.innerHeight);
float[][] heightmap = new float[width][height];
float[][] moisturemap = new float[width][height];
void drawTerrain() {
var seed = random(1, 10000);
var xoffh = 0.0 + seed;
for (var xh = 0; xh < width; xh++)
{
  var yoffh = 0.0 + seed;
  for (var yh = 0; yh < width; yh++)
  {
    heightmap[xh][yh] = noise(xoffh, yoffh);
    yoffh += 0.01;
  }
  xoffh += 0.01;
}
seed = random(1, 10000);
var xoffm = 0.0 + seed;
for (var xm = 0; xm < width; xm++)
{
  var yoffm = 0.0 + seed;
  for (var ym = 0; ym < height; ym++)
  {
    moisturemap[xm][ym] = noise(xoffm, yoffm);
    yoffm += 0.01;
  }
  xoffm += 0.01;
}

float maxDistance;
maxDistance = dist(width / 2, height / 2, width, height);
distances = new float[width][height];
for (int i = 0; i < height; i++)
{
  for (int j = 0; j < width; j++)
  {
    float d = dist(width / 2, height / 2, j, i);
    if (d < 0.5)
    {
      heightmap[j][i] += (d / maxDistance) / 6;
    }
    else if (d > 0.5)
    {
      heightmap[j][i] -= (d / maxDistance) / 6;
    }
  }
}

for (var dx = 0; dx < width; dx++)
{
  for (var dy = 0; dy < height; dy++)
  {
    if (heightmap[dx][dy] < 0.475)
    { // water
      if (map(heightmap[dx][dy], 0, 1, 0, 255) < 100)
      {
        stroke(0, 0, 100);
      }
      else
      {
        stroke(0, 0, map(heightmap[dx][dy], 0, 1, 0, 255));
      }
    }
    else if (heightmap[dx][dy] > 0.475 && heightmap[dx][dy] < 0.5)
    { //sand
      stroke(map(heightmap[dx][dy], 0, 1, 0, 255), map(heightmap[dx][dy], 0, 1, 0, 255), 0);
    }
    else if (heightmap[dx][dy] > 0.575)
    { //mountain
      stroke(map(heightmap[dx][dy], 0, 1, 0, 255), map(heightmap[dx][dy], 0, 1, 0, 255), map(heightmap[dx][dy], 0, 1, 0, 255));
    }
    else
    {
      var magicnum = 0.45; // just for testing
      if (moisturemap[dx][dy] < magicnum)
      {
        stroke(map(heightmap[dx][dy], 0, 1, 0, 255), map(heightmap[dx][dy], 0, 1, 0, 255), 100); // desert
      }
      else if (moisturemap[dx][dy] > magicnum)
      {
        if (moisturemap[dx][dy] < 0.6)
        {
          stroke(0, map(heightmap[dx][dy], 0, 1, 0, 255), 0); // grassland
        }
        else if (moisturemap[dx][dy] > 0.55)
        {
          stroke(0, map(heightmap[dx][dy], 0, 1, 0, 255) / 1.25, 0); // forest
        }
      }
    }
    point(dx, dy);
  }
}
}
void mousePressed() {
  generateTerrain();
}
generateTerrain();
