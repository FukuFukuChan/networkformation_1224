class Network {
  PlayerSet allPlayer ;
  float alpha ; //構築コスト
  int[][] friendSet ; //与えるInstanceの辺集合を配列としたたもの（隣接行列）
  int[][] relationSet ; //Outcomeの辺集合を配列としたもの（隣接行列）
  int deviationCount ;
  Network(int n, float c) {
    allPlayer = new PlayerSet(n, this) ;
    alpha = c ;
    friendSet = new int[allPlayer.size()][allPlayer.size()] ;
    relationSet = new int[allPlayer.size()][allPlayer.size()] ;
    deviationCount = 0 ;
  }
  void setFriendSet(float probability) { //確率probabilityでInstanceを作る
    for(int i = 0 ; i < friendSet.length ; i++) {
      for(int j = i + 1 ; j < friendSet[i].length ; j++) {
        if (random(1) <= probability) {
          friendSet[i][j] = 1 ;
          friendSet[j][i] = 1 ;
        }
      }
    }
  }
  void setBuildSet(int[][] s) {
    for(int i = 0 ; i < s.length ; i++) {
      allPlayer.get(i).setBuildSet(s[i]) ;
    }
  }
  int getDiameter() {
    int diameter = 0 ;
    for(Player p : allPlayer) {
      int[] dist = p.getDistanceCost() ;
      for(int d : dist) {
        if (diameter < d) diameter = d ;
      }
    }
    return diameter ;
  }
  float calSocialCost() {
    float socialCost = 0 ;
    for(Player p : allPlayer) socialCost += p.calCost() ;
    return socialCost ;
  }
  boolean isFeasible() { //実行可能かの判定
    for(int i = 0 ; i < relationSet.length ; i++) {
      for(int j = 0 ; j < relationSet[i].length ; j++) {
        if (relationSet[i][j] == 1 && friendSet[i][j] == 0) return false ;
      }
    }
    return true ;
  }
  boolean isStable() {
    for(Player p : allPlayer) {
      if (p.hasDeviationIncentive()) return false ;
    }
    return true ;
  }
  void deviation() {
    if (!isFeasible()) {
      } else {
        for(Player p : allPlayer) {
          while(p.hasDeviationIncentive()) {
            p.deviation() ;
            deviationCount++ ;
            // for(Player pa : allPlayer) {
            //   print(pa.index + " : ") ;
            //   for(Player pp : pa.buildSet) print(pp.index + ",") ;
            //   println() ;
            // }
            // println("<EdgeSet>") ;
            // arrayPrint(relationSet) ;
            // println("<DistanceCost>") ;
            // for(Player pp : allPlayer) {
            //   int[]dist = pp.getDistanceCost() ;
            //   print(pp.index + ":") ;
            //   for(int i = 0 ; i < dist.length ; i++) {
            //     print("[" + i + "]" + dist[i] + ",") ;
            //   }
            //   println() ;
            // }
            // println("<Cost>") ;
            // for(Player pp : allPlayer) {
            //   println("[" + pp.index + "]" + pp.calCost() + " = " + pp.buildSet.size() + " * " +  alpha + " + " + pp.calDistanceCost()) ;
            // }
          }
        }
        if( !isStable()) deviation() ;
      }
    }
  }
