
import Foundation

class Person
{
    //빈역할 대신해주는 얘들같음 ㅋㅋ

    var name: String = ""
    var age: Int = 0
    var id: Int = 0
    
    init(id:Int, name:String, age:Int)
    {
        self.id = id
        self.name = name
        self.age = age
    }
    
}
