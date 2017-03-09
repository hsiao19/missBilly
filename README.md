# missBilly (2017 政大音樂節互動專案)
這是 2017 年為政大音樂節做的互動專案，專案的內容晚點再打，這邊先介紹這個 processing 專案該怎麼修改。    
下載這個專案，按英文字母 A 之後可以看到動畫的範例效果。
- - -

### 增加新的網格動畫
這支專案已經先寫好了基本架構，接著只要按照底下步驟做，就可以寫一個新的網格動畫了 !

1. 先新增一個 `.pde` 檔案 (如果用 processing IDE 的話就新增一個 tab)，  
   檔名取叫動畫的名字 `(e.g. ExampleShape.pde)` `檔名的第一個字記得要大寫`。
   
2. 接著要開始寫程式了，在剛剛新增的檔案裡面新增一個跟檔名一樣的 class 並且繼承 `Shape`。
   ``` java
   class ExampleShape extends Shape {
      ExampleShape(NodesBase nodesBase, int[] scope, int[] locate) {
        super(nodesBase, scope, locate);
      }
   }
   ```
   這樣就完成了動畫的基本設定。  
   現在只要 new 一個新的 `ExampleShape` 物件，就可以使用這支動畫了。
   ``` java
   ExampleShape example = new ExampleShape(nodesBase, scope, location);
   ```
   這邊的 `nodeBase` 指的是整個專案的節點，要怎麼使用後面再解釋，          
   比較需要注意的是 `scope` 和 `location` 這兩個參數。
   ##### scope
   scope 在這裡是動畫範圍的意思。   
   假設整個專案是由 100(長) x 100(寬) 個節點組成的，那麼 scope 代表的就是這個動畫佔了這 100 x 100 個節點裡面多大的區域。   
   ![scope diagram](/docPic/scopeDiagram.jpg)    
   scope 是一個長度 2 的 int array，第一個值會是動畫的 x 方向的長度，第二個值是 y 方向的長度。
   ``` java
   int[] scope = {6, 5}
   ```
   
   ##### location
   location 是動畫基準位置的意思。指的是動畫左上角的座標。    
   要特別注意這裡的座標這的不是 processing 原生的座標，是專案節點的座標。   
   假設圖型的位在左邊數來第 3 個節點上，那麼 location 就會是 {3, 0}。    
   ![location diagram](/docPic/locationDiagram.jpg)    
   location 和 scope 一樣是一個長度 2 的 array，第一和第二個值分別是轉換過的 x 和 y 座標。
   ``` java
   int[] location = {3, 0}
   ```
   到這裡大概解釋了新增一個動畫物件需要的東西，    
   接下來要真正開始讓網格動起來了。
   
3. 前面定義了動畫的位置和大小，現在要開始實作動態的部分了~   
   在寫客製的動態之前，先介紹一下動畫物件本身具有的動作。   
   動畫物件 `Shape` 目前有五個 function: `moveX` `moveY` `moveXY` `setShape` `shapeInitialize`
   ##### move系列
   move 顧名思義就是讓圖形移動。    
   圖形原本被設定只能在 `scope` 的範圍裡運動，move 系列 function 能夠讓圖形的 `location` 移動。
   ``` java
   moveX(1); //圖形往右邊移動一個節點
   moveX(-1); //圖形往左邊移動一個節點
   moveY(1); //圖形往上移動一個節點
   moveY(-1); //圖形往下移動一個節點
   moveXY(1, 1); //同時移動 X 和 Y 方向
   ```
   ##### setShape(int[] locate)
   setShape 是讓圖型快速移動到某定點的 function，吃一個長度 2 的 array 當參數，array 的第一和第二個值分別是目標地點的 x 和 y `(這裡的 x 和 y 是轉換過節點的 x y)`。
   ``` java
   int[] locate = {2, 2};
   setShape(locate);
   ```
   
   ##### shapeInitialize()
   讓圖形返回最初設定的位置。    
   
   目前 `Shape` 本身的 function 只有這五個，如果未來有更新，可以看 `Shape.pde` 程式原檔。
   
   
4. 介紹完 `Shape` 原生的 function，現在真的要開始寫動態了。    
   還記得前面創了一個叫 `ExampleShape` 的新物件嗎，在 `ExampleShape` 裡新增 function 控制節點就可以客製圖形的動作了。
   ``` java
   class ExampleShape extends Shape {

      ExampleShape(NodesBase nodesBase, int[] scope, int[] locate) {
        super(nodesBase, scope, locate);
      }

      void addDepth() {
        for (int x=0; x<this.scope[0]; x++) {
          for (int y=0; y<this.scope[1]; y++) {
            this.nodes[x][y].add(0, 0, -1);
          }
        }
      }
   }
   ```
   `this.nodes` 是這個圖形的所有節點， `this.nodes[x 座標][y 座標]` 是一個二維陣列，他的第一維和第二維剛好是圖形的 x 和 y 座標，
   這裡的 x 和 y 是相對的，所以圖形左上角的點會是 `this.nodes[0][0]`。 
   
   所有的節點都繼承了 `PVector` 物件，所以 `PVector` 所有的運算 Node 都可以用。    
   控制節點的方式很簡單，找到節點對他執行 `PVector` 的運算就可以了。    
   舉例來說，要讓圖形左上角的節點往下凹陷，可以這麼做:
   ``` java
   this.nodes[0][0].add(0, 0, -1);  //讓 nodes[0][0] 往 (0, 0, -1) 向量移動
   ```
   
   更多 PVector 應用可以看這裡: https://processing.org/reference/PVector.html
   
   操作節點的時候可能會需要圖形的長寬，可以從 this.scope 得到。    
   `this.scope[0]` 是圖形 x 方向的長度，    
   `this.scope[1]` 是圖形 y 方向的長度。
   
   
   :smiley_cat::smirk_cat::smile_cat: 新增動態效果大概到一段落了，休息一下，接下來還有一小段路要走 QQ
   
-

### 新增角色   
一個角色有多個動態效果，所有的動態效果都是附屬在角色底下的，所以動畫不應該被單獨呼叫，而是應該要透過角色來呼叫。
前面寫好了動態，現在要來寫角色來承接他:

1. 一樣先新增一個 `.pde` 檔案，檔名取叫角色的名字 `(e.g. ExampleCharacter.pde)` `檔名的第一個字記得要大寫`。
2. 在剛剛新增的檔案裡面新增一個跟檔名一樣的 class 並且繼承 `Character`。
   ``` java
    class ExampleCharacter extends Character {
      ExampleCharacter(NodesBase nodesBase) {
        super(nodesBase);
      }
    }
   ```
   
3. 接下來要把動態和角色連結
   ``` java
    class ExampleCharacter extends Character {
        ExampleShape exampleShape; // 新增動態物件
        ExampleCharacter(NodesBase nodesBase) {
            super(nodesBase);

            int[] scope = {5, 4}; // 定義 scope
            int[] location = {2, 2};  // 定義 location
            exampleShape = new ExampleShape(this.nodesBase, scope, location); // 新增動態物件
        }
    }
   ```
4. 定義新 function 讓角色可以操作動態效果
   ``` java
   class ExampleCharacter extends Character {
        ExampleShape exampleShape;

        ExampleCharacter(NodesBase nodesBase) {
            super(nodesBase);

            int[] scope = {5, 4};
            int[] location = {2, 2};
            exampleShape = new ExampleShape(this.nodesBase, scope, location);
        }

        void triggerExampleShape() { // 新 function
            exampleShape.addDepth();
        }
    }
   ```
   角色和動態連接這樣就做完了，接下來要進到最後一步，正式套用動畫了 :smiley_cat::smiley_cat::star::star:
   
-

### 正式套用動畫

這裡是最後了 ! 快要完成了 !

1. `ProjectHandler` 是操縱畫面的入口，所有和畫面有關的東西都會在這支檔案裡面。現在要把角色和 `ProjectHandler` 做連接。
    連接方式很簡單，在 `ProjectHandler` 裡面建立角色物件就可以了。
    ``` java
    class ProjectHandler {
      ExampleCharacter exampleCharacter;
      ProjectHandler() {
        exampleCharacter = new ExampleCharacter(nodesBase);
      }
    }
    ```
    
2. 接下來要讓外面可以收到動態，所以建一個 function 把動態丟出去。
   ``` java
   void triggerExampleCharacter() {
        exampleCharacter.triggerExampleShape();
    }
   ```
3. 最後就是在主檔案 `missBilly` 接收了
   ```
   void draw(){
        if (keyPressed) {
          if (key == 'A' || key == 'a') {
            projectHandler.triggerExampleCharacter();
          }
        }
    }
   ```
   這裡設定按下鍵盤 A 鍵之後觸發效果，之後應該會寫一個物件接收訊號。
   
   
   完成了 :star::star::star:
   
   
-

### 程式架構
如果有興趣的話，可以看看底下的程式架構    
(我累ㄌ 之後補)