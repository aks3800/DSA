enum VerticeColor {
    case WHITE
    case GREY
    case BLACK
}

class Vertices {
    let key: String
    var color: VerticeColor = VerticeColor.WHITE
    var predecessor: Vertices?
    var distanceFromSource: Int = Int.max
    var edge: [Vertices] = []
    init(key: String) {
        self.key = key
    }
    
    func setEdges(edge: [Vertices]) -> Void {
        self.edge = edge
    }
    
}

class Graph {
    let vertices: [Vertices]
    init(v: [Vertices]) {
        self.vertices = v
    }
    func getNumberOfVertices() -> Int {
        return vertices.count
    }
    func printDistanceFromSource() -> Void {
        for v in vertices {
            print("\(v.key) ---- \(v.distanceFromSource)")
        }
    }
}


struct Queue{
    var items:[Vertices] = []
    
    mutating func enqueue(element: Vertices)
    {
        items.append(element)
    }
    
    mutating func dequeue() -> Vertices?
    {
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement
        }
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}


func BFS(G: Graph, s: Vertices) {
    for vertice in G.vertices {
        vertice.color = .WHITE
        vertice.distanceFromSource = Int.max
        vertice.predecessor = nil
    }
    
    s.color = .GREY
    s.distanceFromSource = 0
    s.predecessor = nil
    
    var queue = Queue()
    queue.enqueue(element: s)
    
    while !queue.isEmpty() {
        if let u = queue.dequeue() {
            for v in u.edge {
                if v.color == .WHITE {
                    v.color = .GREY
                    v.distanceFromSource = u.distanceFromSource + 1
                    v.predecessor = u
                    queue.enqueue(element: v)
                }
            }
            u.color = .BLACK
        }
    }
}


let s = Vertices(key: "s")
let r = Vertices(key: "r")
let v = Vertices(key: "v")
let t = Vertices(key: "t")
let u = Vertices(key: "u")
let x = Vertices(key: "x")
let y = Vertices(key: "y")
let w = Vertices(key: "w")

s.setEdges(edge: [r, w])
r.setEdges(edge: [v, s])
v.setEdges(edge: [r])
w.setEdges(edge: [s, t, x])
t.setEdges(edge: [w, x, u])
x.setEdges(edge: [w, t, y, u])
y.setEdges(edge: [x, u])
u.setEdges(edge: [t, x, y])

let G = Graph(v: [s, r, v, w, t, x, y, u])

//G.printDistanceFromSource()
BFS(G: G, s: s)
G.printDistanceFromSource()
