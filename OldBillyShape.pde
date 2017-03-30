class OldBillyNormalShape extends Shape {
    
    float time;
    float energy;
    ArrayList <CalmWave> calmWaves;
  
    OldBillyNormalShape(NodesBase nodesBase, int[] scope, int[] locate){
        super(nodesBase, scope, locate);
        time = frameCount;
        energy = 1.0;  
        calmWaves = new ArrayList<CalmWave>();
        calmWaves.add(new CalmWave(new PVector(this.scope[0], this.scope[1] / 0.2)));
    }
  
    void addWaves(){
        translate(this.scope[0], this.scope[1] / 2, -200);
        translate(-this.scope[0], -this.scope[1] / 2, 0);
        for (int x=0; x<this.scope[0]; x++) {
            for (int y=0; y<this.scope[1]; y++) {
                PVector p = new PVector(x, y);
                pushMatrix();
                float z = 0;
                for(CalmWave cw: calmWaves){
                    z += cw.getValue(p);
                    this.nodes[x][y].add(0, 0, z*0.1);
                }
                translate(x, y, z);
                popMatrix();
            }
        }
        ArrayList<CalmWave> nextCalmWaves = new ArrayList<CalmWave>();
        for(CalmWave cw: calmWaves){
            if(cw.energy >= 0.01){
                nextCalmWaves.add(cw);
            }
        }
        calmWaves = nextCalmWaves;
    }
}

class OldBillyInteractShape extends Shape {
    float time;
    float energy;
    ArrayList <ComingWave> comingWaves;
  
    OldBillyInteractShape(NodesBase nodesBase, int[] scope, int[] locate){
        super(nodesBase, scope, locate);
        time = frameCount;
        energy = 1.0;    
        comingWaves = new ArrayList<ComingWave>();
        comingWaves.add(new ComingWave(new PVector(this.scope[0], this.scope[1])));
    }
  
    void addWaves(){
        //translate(this.scope[0] / 2, this.scope[1] / 2, -200);
        //translate(-this.scope[0] / 2, -this.scope[1] / 2, 0);
        for (int x=0; x<this.scope[0]; x++) {
            for (int y=0; y<this.scope[1]; y++) {
                PVector p = new PVector(x, y);
                pushMatrix();
                float z = 0;
                for(ComingWave cw: comingWaves){
                    z += cw.getValue(p);
                    this.nodes[x][y].add(0, 0, z*0.1);
                }
                translate(x, y, z);
                popMatrix();
            }
        }  
        for(ComingWave cw: comingWaves){
            cw.update();
        }
        ArrayList<ComingWave> nextComingWaves = new ArrayList<ComingWave>();
        for(ComingWave cw: comingWaves){
            if(cw.energy >= 0.01){
                nextComingWaves.add(cw);
            }
        }
        comingWaves = nextComingWaves;
    }
}

class CalmWave{
    float maxAmp = 20;
    float maxDistance = 400;
    PVector loc;
    float time;
    float energy;
  
    CalmWave(PVector _loc){
        loc = _loc;
        time = frameCount;
        energy = 1.0;
    }
    float getValue(PVector p){
        float d = loc.dist(p);
        float amp = maxAmp * energy * ((maxDistance - d) / maxDistance);
        return map(sin(d * PI / 10 - (frameCount - time) * 0.1), -1, 1, -amp, amp);
    } 
}

class ComingWave{
    float maxAmp = 20;
    float maxDistance = 400;
    PVector loc;
    float time;
    float energy;
  
    ComingWave(PVector _loc){
        loc = _loc;
        time = frameCount;
        energy = 1.0;
    }
    void update(){
        //energy *= 0.995;
        energy *= 1.0;
    }
    float getValue(PVector p){
        float d = loc.dist(p);
        float amp = maxAmp * energy * ((maxDistance - d) / maxDistance);
        return map(sin(d * PI / 10 - (frameCount - time) * 0.1), -1, 1, -amp, amp);
    } 
}