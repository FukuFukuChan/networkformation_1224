class Network {
  PlayerSet allPlayer ;
  float alpha ; //構築コスト
  int[][] friendSet ; //与えるInstanceの辺集合を配列としたたもの（隣接行列）
  int[][] relationSet ; //Outcomeの辺集合を配列としたもの（隣接行列）
  int[] degree ;
  Network(int n, float c) {
    allPlayer = new PlayerSet(n, this) ;
    alpha = c ;
    friendSet = new int[allPlayer.size()][allPlayer.size()] ;
    relationSet = new int[allPlayer.size()][allPlayer.size()] ;
    degree = new int[allPlayer.size()] ;
  }
  void setFriendSet(float probability) { //確率probabilityでInstanceを作る
    for(int i = 0 ; i < friendSet.length ; i++) {
      for(int j = i + 1 ; j < friendSet[i].length ; j++) {
        if(random(1) <= probability) {
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
  void setDegree() {
    for(Player p : allPlayer) {
      p.getDegree() ;
      degree[p.index] = p.degree ;
    }
  }
  boolean exsitThisDegree(int n) {
    for(Player p : allPlayer) if (p.degree == n) return true ;
    return false ;
  }
  int getDiameter() {
    int diameter = 0 ;
    for(Player p : allPlayer) {
      int[] dist = p.getDistanceCost() ;
      for(int d : dist) {
        if(diameter < d) diameter = d ;
      }
    }
    return diameter ;
  }
  boolean isFeasible() { //実行可能かの判定
    for(int i = 0 ; i < relationSet.length ; i++) {
      for(int j = 0 ; j < relationSet[i].length ; j++) {
        if(relationSet[i][j] == 1 && friendSet[i][j] == 0) return false ;
      }
    }
    return true ;
  }
  boolean isStable() {
    for(Player p : allPlayer) {
      if(p.hasDeviationIncentive()) return false ;
    }
    return true ;
  }
  boolean isEqualNetwork() {
    return isEqualEdgeSize(friendSet, relationSet) ;
  }
  boolean isTree() {
    int edgeSize = 0 ;
    for(int i = 0 ; i < relationSet.length ; i++) {
      for(int d : relationSet[i]) edgeSize += d ;
    }
    return edgeSize == allPlayer.size() - 1 ;
  }
  boolean isTreePlusOneLink() {
    int edgeSize = 0 ;
    for(int i = 0 ; i < relationSet.length ; i++) {
      for(int d : relationSet[i]) edgeSize += d ;
    }
    return edgeSize == allPlayer.size();
  }
  boolean isTreePlusTwoLink() {
    int edgeSize = 0 ;
    for(int i = 0 ; i < relationSet.length ; i++) {
      for(int d : relationSet[i]) edgeSize += d ;
    }
    return edgeSize == allPlayer.size() + 1;
  }

  boolean isTreePlusThreeLink() {
    int edgeSize = 0 ;
    for(int i = 0 ; i < relationSet.length ; i++) {
      for(int d : relationSet[i]) edgeSize += d ;
    }
    return edgeSize == allPlayer.size() + 2;
  }
  boolean countThisDegree(int n, int k) {
    int count = 0 ;
    for(Player p : allPlayer) if (p.degree == n) count++ ;
    return count == k;
  }
}
