require "socket"

fruit_facts = ["Not all Oranges are Orange: In sub-tropical growing regions (like Brazil, the country that grows the most oranges in the world) there are never temperatures cold enough to break down the chlorophyll in the fruit’s skin, which means it may still be yellow or green even when it’s ripe. But because American consumers can’t fathom such a phenomenon, imported oranges get treated with ethylene gas to get rid of the chlorophyll and turn them orange.
This also means that Florida oranges tend to be yellower than California oranges, because they’re grown further south.","Most commercial fruits are clones: Which, when you actually look at supermarket displays of perfectly identical apples and oranges and peaches, isn’t that shocking. Producers want specific varieties of fruit, called cultivars (say, Fuji apples or Bosc pears) to remain perfectly consistent, without all the unpredictable genetic mutations you get with old-fashioned sexual reproduction (pollinating flowers, planting seeds, and seeing what the heck comes up).","The apples you eat mighe be a year old: Apples are for sale in grocery stores and farmers markets year round, even though their harvesting season (at least in the U.S.) only lasts a few months in the fall. HOW CAN IT BE? Well, increasingly sophisticated cold storage technology means it’s possible (and/or likely) that the crisp, juicy apple you’re eating in August 2013 was actually harvested in October 2012.","Bananas get artificially ripened (after being shipped) to one of seven “shades” of ripeness.","U.S. raisin farmers aren’t allowed to sell all the raisins they grow; they must contribute to a “national raisin reserve” if supply exceeds demand.","Grapefruit can cause dangerous reactions with some prescription medications.: “For 43 of the 85 drugs now on the list, consumption with grapefruit can be life-threatening, Dr. Bailey said. Many are linked to an increase in heart rhythm, known as torsade de pointes, that can lead to death.”","Cranberries do BOUNCE: This magic property (which is thanks to the same air pockets that lets cranberries float) was discovered in 1880 by the compellingly named cranberry innovator John “Peg Leg” Webb, who dropped a bunch of cranberries down the stairs. Growers today actually still test berries’ athletic abilities to determine their quality, and sort them accordingly, with a tool called the “bounce board separator” — the higher the bounce, the better the berry..","One pomegranate can hold more than 1,000 seeds.","A strawberry isn’t technically a berry, or even a fruit: Berries, by definition, have their seeds on the inside, which strawberries clearly don’t. The plant produces a fleshy “false fruit” aka pseudocarp from its flower, and what we think of as the seeds on the outside are the “true” fruits. Bottom line: Whatever, they’re delicious."]

server = "chat.freenode.net"
port = "6667"
nick = "VeggieBot"
channel = "#bitmaker"
greeting_prefix = "privmsg #{channel} :"
greetings = ["fruit","veggie","ping"] #must be lowercase to match

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
irc_server.puts "PRIVMSG #{channel} :Type 'fruit' or 'veggie' to learn more"

until irc_server.eof? do
  msg = irc_server.gets.downcase
  puts msg

  was_greeted = false
    if msg.include?("fruit")
  was_greeted = "fruit"
    end
    if 
      msg.include?("veggie") or msg.include?("ping")
  was_greeted = "veggie"
    end

  if msg.include?(greeting_prefix) and was_greeted == "fruit"
          response1 = fruit_facts[rand(0..fruit_facts.length)]
          irc_server.puts "PRIVMSG #{channel} :#{response1}"
  end

  if msg.include?(greeting_prefix) and was_greeted == "veggie"
          response2 = "pong"          
          irc_server.puts "PRIVMSG #{channel} :#{response2}"
  end

end
