Player.destroy_all
player = Player.create(email: 'test@gmail.com', password: '123456')
Player.create(
  name: 'Joshua Kimmich', birth: Date.new(1995,8,2), citizenship: 'Germany', hight: 176, position: 'Midfield', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Endurance'), address: "Margaretenstr. 37, 12203 Berlin")
Player.create(
  name: 'Thiago Alcántara do Nascimento', birth: Date.new(1991,11), citizenship: 'Spain', hight: 174, position: 'Midfield', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Endurance'), address: "Rudi-Dutschke-Straße 26, 12203 Berlin")
Player.create(
  name: 'Marc-André ter Stegen', birth: Date.new(1992,4,30), citizenship: 'Germany', hight: 187, position: 'Goalkeeper', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Strong'), address: "Friedrichstraße 140, 12203 Berlin")
Player.create(
  name: 'Emre Can', birth: Date.new(1994,1,12), citizenship: 'Germany', hight: 184, position: 'Defender', skill: ('Passing', 'Technique', 'Tactic', 'Teamplayer', 'Strong'), address: "Olympischer Platz 3, 14053 Berlin")
