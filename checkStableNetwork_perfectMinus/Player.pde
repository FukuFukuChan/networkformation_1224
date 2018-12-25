class Player {
  int index ;
  PlayerSet buildSet ;
  Network network ; //自身の所属しているネットワーク
  Player buildPlayer ; //逸脱するときの構築する辺
  Player removePlayer ; //逸脱するときの削除する辺
  int degree ;
  Player(int i, Network f) {
    index = i ;
    buildSet = new PlayerSet() ;
    network = f ;
    buildPlayer = new Player() ;
    removePlayer = new Player() ;
    degree = 0 ;
  }
  Player() {
  }
  void buildLink(Player p) {
    buildSet.add(p) ;
    network.relationSet[index][p.index] = 1 ;
  }
  void removeLink(Player p) {
    buildSet.remove(p) ;
    network.relationSet[index][p.index] = 0 ;
  }
  void setBuildSet(int s[]) { //空のネットワークではないネットワークから始めるとき必要
    for(int i = 0 ; i < s.length ; i++) {
      if(s[i] == 1) buildSet.add(network.allPlayer.get(i)) ;
    }
  }
  void getDegree() {
    for(Player p : network.allPlayer) {
      if (p.buildSet.contains(this)) degree++ ;
    }
    degree += buildSet.size() ;
  }
  int[] getDistanceCost() { //幅優先探索で自身以外の頂点への最短距離を求める
    int[] dist = new int[network.allPlayer.size()] ;
    for(int i = 0 ; i < dist.length ; i++) dist[i] = 1000000 ;
    dist[index] = 0 ;
    IntList searched = new IntList() ;
    IntList discovered = new IntList() ;
    discovered.append(this.index) ;
    while(discovered.size() != 0) {
      searched.append(discovered.get(0)) ;
      int n = discovered.remove(0) ;
      for(Player p : network.allPlayer) {
        if(discovered.hasValue(p.index) || searched.hasValue(p.index)) continue ;
        else if(network.relationSet[n][p.index] == 0 && network.relationSet[p.index][n] == 0) continue ;
        dist[p.index] = dist[n] + 1 ;
        discovered.append(p.index) ;
      }
    }
    return dist ;
  }
  int calDistanceCost() {
    int distanceCost = 0 ;
    int[] dist = getDistanceCost() ;
    for(int d : dist) distanceCost += d ;
    return distanceCost ;
  }
  float calCost() {
    return buildSet.size() * network.alpha + calDistanceCost() ;
  }
  PlayerSet getConsiderSet() { //逸脱として構築できる辺の候補の集合
    PlayerSet cs = new PlayerSet() ;
    for(Player p : network.allPlayer) {
      if(p == this || network.friendSet[index][p.index] == 0 || buildSet.contains(p)) continue ;
      cs.add(p) ;
    }
    return cs ;
  }
  boolean hasBuildDeviation() { //逸脱として追加できる辺が存在するか
    buildPlayer = null ;
    PlayerSet cs = getConsiderSet() ;
    float currentCost = calCost() ;
    for(Player p : cs) {
      buildLink(p) ;
      float cost = calCost() ;
      removeLink(p) ;
      if(cost < currentCost) {
        buildPlayer = p ;
        return true ;
      }
    }
    return false ;
  }
  boolean hasRemoveDeviation() { //逸脱として削除できる辺が存在するか
    removePlayer = null ;
    PlayerSet bSet = (PlayerSet) buildSet.clone() ;
    float currentCost = calCost() ;
    for(Player p : bSet) {
      removeLink(p) ;
      float cost = calCost() ;
      buildLink(p) ;
      if(cost < currentCost) {
        removePlayer = p ;
        return true ;
      }
    }
    return false ;
  }
  boolean hasBuildandRemoveIncentive() { //逸脱として追加と削除が同時にできる辺が存在するか
    buildPlayer = null ;
    removePlayer = null ;
    PlayerSet cs = getConsiderSet() ;
    PlayerSet bSet = (PlayerSet) buildSet.clone() ;
    float currentCost = calCost() ;
    for(Player p : bSet) {
      removeLink(p) ;
      for(Player pp : cs) {
        buildLink(pp) ;
        float cost = calCost() ;
        removeLink(pp) ;
        if(cost < currentCost) {
          buildPlayer = pp ;
          removePlayer = p ;
          return true ;
        }
      }
      buildLink(p) ;
    }
    return false ;
  }
  boolean hasDeviationIncentive() {
    return hasBuildDeviation() || hasRemoveDeviation() || hasBuildandRemoveIncentive() ;
  }
}

class PlayerSet extends ArrayList<Player> {
  PlayerSet(int n, Network f) {
    for(int i = 0 ; i < n ; i++) {
      add(new Player(i, f)) ;
    }
  }
  PlayerSet() {
  }
}
