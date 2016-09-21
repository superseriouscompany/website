# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project = Project.create({
  name: "This Website",
  description: """
    Our first project is this shameless, self-absorbed website.
    It’s here mostly to show people back home that we’re doing something and to post future projects, favorable pics of ourselves, etc.
    You’re already here, so don’t click it, but here it is:
  """,
  url: "http://superseriouscompany.com",
  link: "superseriouscompany.com",
  slug: "this-website"
})

days = project.days.create([
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
    image_url: 'comic2.jpg',
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
    """,
    order: "neil"
  },
  {
    image_url: 'comic3.jpg',
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
    """,
    order: "neil"
  },
  {
    image_url: 'comic4.jpg',
    portuguese_title: 'Dia Quatro',
    english_title: 'Day Four',
    santi_quote: """
      <p>
        Okay so Neil ate most of my food today ಠ_ಠ He's back to beasting. Website should all be done by tomorrow – and, if it is, Neil says we get to have a little candlelit business dinner to celebrate.
      </p>
    """,
    neil_quote: """
      <p>
        I nearly shit my pants today because of the shared bathroom. The website copy makes me laugh. I am out of food.
      </p>
    """,
    order: "neil"
  },
  {
    image_url: 'comic5.jpg',
    portuguese_title: 'Dia Cinco',
    english_title: 'Day Five',
    santi_quote: """
      <p>
        Daddy's tired.
      </p>
    """,
    neil_quote: """
      <p>
        We worked on the website for 14 hours today. Our host told Santi that sometimes it rains here and he looked really scared and he hasn’t been the same since. I ate a zucchini today and it was so filling. Last night I had a dream about bread.
      </p>
    """,
    order: "neil"
  },
  {
    image_url: 'comic6.jpg',
    portuguese_title: 'Dia Sex',
    english_title: 'Day Six',
    santi_quote: """
      <p>
        Website wup-ah!!! One of our proudest moments. We setup this link where anyone can click it at any time and enter a group video chat with us – just like pop in. We've had ~40 visitors tonight. Anyways, at one point, a random shirtless dude laying on his bed popped in, got scared, and popped out.
      </p>
    """,
    neil_quote: """
      <p>
        I took Santi out to a nice dinner to celebrate making the website. He joked that we never go out anymore, but I caught a twinge of authentic sadness. At a restaurant on the river we toasted vinho branco over grilled octopus and talked about the future. When we got back, a bunch of our tinder friends and one unsuspecting intern jumped into our video chat. I am full and happy.
      </p>
    """,
    order: "neil"
  },
  {
    image_url: 'comic7.jpg',
    portuguese_title: 'Dia Sete',
    english_title: 'Day Seven',
    santi_quote: """
      <p>
        Sure, Peniche's a bit run down, but this place has skateparks!, soccer fields!, the best waves in Europe!, fish! – bunch of stuff. But anyways yeah Neil's not too stoked right meow.
      </p>
    """,
    neil_quote: """
      <p>
        So this is where we’re gonna live for a year. For whatever reason I was picturing big open windows to the beach. Whenever I go anywhere I’m picturing big open windows to a private beach. But it’s never like that I guess. At least the internet is still fast. We’re gonna spend the next week probably getting the essentials: bikes for transportation, boards for recreation and a house.
      </p>
    """,
    order: "neil"
  },
  {
    image_url: 'comic8.jpg',
    portuguese_title: 'Dia Oito',
    english_title: 'Day Eight',
    santi_quote: """
      <p>
        Err... oops.
      </p>
    """,
    neil_quote: """
      <p>
        Today we finally hit the ocean. Santi gave me a crash course in boogie boarding, saying phrases like “really easy,” “perfect for beginners,” and “waves are tiiiiny today.” An hour later I’m on my butt in the shallow water, fins akimbo, facing the shore. Dead eyes idly surveying the boogie board I’d long since let go of. Completely defeated.
      </p>
    """,
    order: "neil"
  },
  {
    image_url: 'comic9.jpg',
    portuguese_title: 'Dia Nove',
    english_title: 'Day Nine',
    santi_quote: """
      <p>
        Everything was going great; we got everything done for the day, had a fricken' blast doing it. We were even high fiving each other in the bus… high fives retracted. ಠ_ಠ
      </p>
    """,
    neil_quote: """
      <p>
        Tonight we were homeless in Lisbon lugging around a broken bike and we got robbed. It was also our best night here so far.
      </p>
    """,
    order: "neil"
  },
  {
    image_url: 'comic10.jpg',
    portuguese_title: 'Dia Dez',
    english_title: 'Day Ten',
    santi_quote: """
      <p>
        Today we biked to all the nearby towns in hopes of finally finding an apartment to live in permanently. We were lost in a field of corn for like an hour. Gonna just try again tomorrow.
      </p>
    """,
    neil_quote: """
      <p>
        We apartment hunted on bikes for three hours today. My bike seat hurts my butt a lot and at one point I caught myself about to cry so I laughed out loud instead. It was real loud but I don’t think Santi heard bc he was too far ahead of me.
      </p>
    """,
    order: "santi"
  },
  {
    image_url: 'comic11.jpg',
    portuguese_title: 'Dia Onze',
    english_title: 'Day Eleven',
    santi_quote: """
      <p>
        We decided to put all work aside until we find a permanent residence; nothing's turned up yet, and it's kind of tearing Super Serious apart existentially. Neil says his mind is like a blender with nothing in it. I'm looking at flights to France.
      </p>
    """,
    neil_quote: """
      <p>
        I watched 8 hours of tv today and cooked two meals and that’s it. Starting to go a little stir-crazy in this airbnb, I can’t wait to settle in to a place and start working for real.
      </p>
    """,
    order: "santi"
  },
  {
    image_url: 'comic12.jpg',
    portuguese_title: 'Dia Doze',
    english_title: 'Day Twelve',
    santi_quote: """
      <p>
        This isn't what I had envisioned, but they left us no choice. Needless to say, a couple apartments appeared out of thin air...
      </p>
    """,
    neil_quote: """
      <p>
        I learned that “tudo bem” roughly means “it’s fine” and now I’m speaking confident Portuguese. I don’t understand most of the responses, but tudo bem.
      </p>
    """,
    order: "santi"
  },
  {
    image_url: 'comic13.jpg',
    portuguese_title: 'Dia Treze',
    english_title: 'Day Thirteen',
    santi_quote: """
      <p>
        We split up today: Neil biked around talking to real estate agents in Portuguese, while I bailed to go surf with a friend. Waves were exchanged. Turns out this guy, Tiago, knows absolutely everyone here. He and his family invited us out and hooked it up with contacts to the coolest houses around. Super Serious HQ coming soon.
      </p>
    """,
    neil_quote: """
      <p>
        We gon' make it
      </p>
    """,
    order: "santi"
  },
])
