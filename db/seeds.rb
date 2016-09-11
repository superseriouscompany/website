# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

days = Day.create([
  {
    image_url: 'comic1.jpg',
    portuguese_title: 'Dia Um',
    english_title: 'Day One',
    santi_quote: """
      <p>
        Today, the big tuna and the little tuna woke up in Portugal (I'm the big tuna).
        This here's a holy place: the only country on the planet to provide low living costs, fast internet speeds, AND epic surf.
        Here, we plan on building a business that will finally make us rich and famous – behold Super Serious Company.
        We thought it wise to start by writing down our ten-, five-, and one-year goals.
      </p>
    """,
    neil_quote: """
      <p>
        We did long term goal setting and Santi and I are aligned in our visions of grandiose and eccentric lives, except my 10 year goal list has “Kids” and his 5 year goal list has “No Kids.”
      </p>
      <p>
        Our weekly food budget is 60 euros each. I spent 46 euros today and I ate more than half my food already and I am panicking.
      </p>
      <p>
        While I was making dinner, Santi inexplicably put his fuck playlist on the big jambox.
      </p>
    """
  },
  {
    image_url: 'https://cldup.com/3GxrSJdh1L.jpg',
    portuguese_title: 'Dia Dois',
    english_title: 'Day Two',
    santi_quote: """
      <p>
        Neil's sad, because we're pretty much fucked.
        I'm playing the forward-looking, hopeful, we-can-do-this role, but when he's not looking, I sneak these little existential-angst looks out the window – Mazzy Star playing in the headphones, etc.
        Just gonna ignore the daunt and focus on the micro projects. Signing off, the big tuna.
      </p>
    """,
    neil_quote: """
      <p>
        Despite getting two promising leads on AWS credits for the business, I felt ineffective today. It might be because:
      </p>

      <ul>
        <li>our work life balance is tilting towards life and I wrote my first line of code at 9:30pm.</li>
        <li>my body is wondering what happened to the surplus of pizza and cocktail calories it was trained to rely on in NYC.</li>
        <li>when you work on your own shit, it’s harder to finish fast by ignoring better ways to do things.</li>
      </ul>

      <p>
        Regardless, I’m gonna wake up tomorrow and start working and not stop til I feel effective again. Also Santi’s website design looks dope.
      </p>
    """
  },
  {
    image_url: 'https://cldup.com/TBSEjM-dw2.jpg',
    portuguese_title: 'Dia Três',
    english_title: 'Day Three',
    santi_quote: """
      <p>
        All we did today was work. I stepped out for a few minutes to get some groceries and ended up sitting in a church, staring at this statue of a man carrying another man, thinking about how buhoned my love life just got.
      </p>
    """,
    neil_quote: """
      <p>
        Creating feels good. Santi casually told me he sat in a church pew and realized he “needed chicks.” Two kiwis, three eggs and nine shrimp remain.
      </p>
    """
  }
])
