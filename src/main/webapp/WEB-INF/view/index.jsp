<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>resturant</title>
    <link rel="stylesheet" href="css/all.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
  </head>
  <body>
    <nav class="nav">
      <div class="logo">
        <a href="index"><img src="images/klassy-logo.png" alt="" /></a>
      </div>
      <div class="links">
        <ul>
          <li><a class="active" href="#home">home</a></li>
          <li><a href="#about">about</a></li>
          <li><a href="#menu">menu</a></li>
          <li><a href="#chefs">chefs</a></li>
          <li><a href="#contact" class="last">contact us</a></li>
        </ul>
        <i class="fas fa-bars"></i>
      </div>
      <div class="sign">
        <c:if test="${!login}">
          <div class="signin">
            <a href="login">Login</a>
          </div>
          <div class="regester"><a href="register">Register</a></div>
        </c:if>
        <div class="regester"><a href="logout">Logout</a></div>
        <div class="icon">
          <a href="myCart2">
            <i
              class="fa fa-shopping-cart"
              style="font-size: 48px; color: red"
            ></i>
          </a>
          <span> <%= request.getSession().getAttribute("number") %></span>
        </div>
      </div>
    </nav>

    <section class="home" id="home">
      <div class="container">
        <div class="leftside">
          <h4>klassycafe</h4>
          <p>the best experience</p>
          <div class="btn">make a reservation</div>
        </div>
        <div class="rightside">
          <div class="slide">
            <img src="images/slide-01.jpg" alt="" />
            <img src="images/slide-02.jpg" alt="" />
            <img src="images/slide-03.jpg" alt="" />
            <img src="images/slide-02.jpg" alt="" />
          </div>
        </div>
      </div>
    </section>

    <section class="about" id="about">
      <div class="container">
        <div class="aboutleft">
          <p class="aboutus">about us</p>
          <h2>We Leave A Delicious Memory For You</h2>
          <p class="disk">
            Klassy Cafe is one of the best restaurant HTML templates with
            Bootstrap v4.5.2 CSS framework. You can download and feel free to
            use this website template layout for your restaurant business. You
            are allowed to use this template for commercial purposes. You are
            NOT allowed to redistribute the template ZIP file on any template
            donwnload website. Please contact us for more information.
          </p>
          <div class="boxs">
            <img src="images/about-thumb-01.jpg" alt="" />
            <img src="images/about-thumb-02.jpg" alt="" />
            <img src="images/about-thumb-03.jpg" alt="" />
          </div>
        </div>
        <div class="aboutright">
          <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a>
          <img src="images/about-video-bg.jpg" alt="" />
        </div>
      </div>
    </section>
    <section class="menu" id="menu">
      <div class="container">
        <p class="aboutus general">about us</p>
        <h2>Our Selection Of Foods With Quality Taste</h2>
        <div class="img-galary">
          <c:forEach items="${foods}" var="food">
            <div class="box" style="height: fit-content">
              <img src="${food.url}" alt="" />

              <div class="info" style="width: fit-content">
                <h2>${food.name}</h2>
                <h3>${food.category.name}</h3>
                <p>${food.detail}</p>
                <div class="price">
                  <p class="doll">Discount : ${food.discount}%</p>
                </div>
                <div class="price">
                  <p class="doll" style="background-color: gray">
                    Price : ${food.price}$
                  </p>
                </div>
                <div class="price">
                  <p class="doll">Total : ${food.total}$</p>
                </div>
                <div class="price">
                  <div class="addtocard">
                    <a
                      href="addToCart/${food.id}"
                      style="font-size: x-large; color: white"
                      >Add To Cart</a
                    >
                    <i
                      class="fa fa-shopping-cart"
                      style="font-size: 24px; color: black"
                    ></i>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
          <!-- <div class="box">
            <img src="images/menu-item-01.jpg" alt="" />

            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-01.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-01.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-01.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-01.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-05.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-02.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-02.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-04.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-04.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div>
          <div class="box">
            <img src="images/menu-item-04.jpg" alt="" />
            <div class="info">
              <h2>tall classy bread</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Exercitationem in laborum perferendis
              </p>
              <div class="price">
                <p class="doll">22$</p>
                <div class="addtocard">add to acrd</div>
              </div>
            </div>
          </div> -->
        </div>
      </div>
    </section>
    <section class="chefs" id="chefs">
      <p class="chefspar">our chefs</p>
      <h2 class="desk">We offer the best ingredients for you</h2>
      <div class="container">
        <div class="box">
          <div class="images">
            <div class="overlay"></div>
            <img src="images/chefs-01.jpg" alt="" />
          </div>
          <div class="icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
          </div>
          <div class="info">
            <div class="name">Randy Walker</div>
            <div class="position">Pastry Chef</div>
          </div>
        </div>

        <div class="box">
          <div class="images">
            <div class="overlay"></div>
            <img src="images/chefs-02.jpg" alt="" />
          </div>
          <div class="icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
          </div>
          <div class="info">
            <div class="name">Randy Walker</div>
            <div class="position">Pastry Chef</div>
          </div>
        </div>

        <div class="box">
          <div class="images">
            <div class="overlay"></div>
            <img src="images/chefs-03.jpg" alt="" />
          </div>
          <div class="icons">
            <i class="fab fa-facebook-f"></i>
            <i class="fab fa-twitter"></i>
            <i class="fab fa-instagram"></i>
          </div>
          <div class="info">
            <div class="name">Randy Walker</div>
            <div class="position">Pastry Chef</div>
          </div>
        </div>
      </div>
    </section>
    <section class="contact" id="contact">
      <div class="container">
        <div class="left">
          <p class="aboutus general">contact us</p>
          <h2 class="desk">
            Here You Can Make A Reservation Or Just walkin to our cafe
          </h2>
          <p class="par">
            Donec pretium est orci, non vulputate arcu hendrerit a. Fusce a
            eleifend riqsie, namei sollicitudin urna diam, sed commodo purus
            porta ut.
          </p>
          <div class="box">
            <div class="card">
              <i class="fas fa-phone-alt"></i>
              <h2>Phone Numbers</h2>
              <div class="num">+201211074252</div>
              <div class="num">+201211074252</div>
            </div>
            <div class="card">
              <i class="fas fa-envelope"></i>
              <h2>Emails</h2>
              <div class="mails num">JavaDeveloepr@gmail.com</div>
              <div class="mails num">JavaDeveloper@gmail.com</div>
            </div>
          </div>
        </div>
        <div class="right">
          <form action="addReservation" method="post">
            <h2>Table Reservation</h2>
            <div class="formcon">
              <input type="text" placeholder="Your Name *" name="name" />
              <input type="email" id="" placeholder="your email" name="email" />
              <input type="text" placeholder="your Phone" name="phone" />
              <select name="numberOfGuests" id="">
                <!-- <option>number of guest</option> -->
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
              </select>
              <input type="date" name="date" id="" />
              <select name="time" id="">
                <option value="Breakfast">Breakfast</option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
              </select>
            </div>
            <textarea
              name="message"
              id=""
              cols="60"
              rows="10"
              style="font-weight: bold"
            ></textarea>
            <c:if test="${reservation}">
              <div
                class="btn"
                type="submit"
                style="cursor: pointer; background-color: gray"
              >
                You Will Have A Good Time.....
              </div>
            </c:if>
            <button class="btn" type="submit" style="cursor: pointer">
              make reservation
            </button>
          </form>
        </div>
      </div>
    </section>
    <section class="klassy">
      <p class="klas">KLASSY WEEK</p>
      <h2 class="klasp">This Week’s Special Meal Offers</h2>
      <div class="filterbox">
        <div class="box">
          <img src="images/tab-icon-01.png" alt="" />
          <div class="boxp active" data-food="breakfast">Breakfast</div>
        </div>
        <div class="box">
          <img src="images/tab-icon-02.png" alt="" />
          <div class="boxp" data-food="lunch">lunch</div>
        </div>
        <div class="box">
          <img src="images/tab-icon-03.png" alt="" />
          <div class="boxp" data-food="dunner">dunner</div>
        </div>
      </div>
      <div class="container">
        <div class="box lunch breakfast">
          <img src="images/tab-item-01.png" alt="" />
          <div class="info">
            <h2>Eggs Omelette</h2>
            <p>
              Lorem ipsum dolor sit amet, consectetur koit adipiscing elit, sed
              do.
            </p>
          </div>
          <div class="price">$44</div>
        </div>
        <div class="box dunner breakfast">
          <img src="images/tab-item-02.png" alt="" />
          <div class="info">
            <h2>Orange Juice</h2>
            <p>
              Lorem ipsum dolor sit amet, consectetur koit adipiscing elit, sed
              do.
            </p>
          </div>
          <div class="price">$44</div>
        </div>
        <div class="box dunner breakfast">
          <img src="images/tab-item-03.png" alt="" />
          <div class="info">
            <h2>Fruit Salad</h2>
            <p>
              Lorem ipsum dolor sit amet, consectetur koit adipiscing elit, sed
              do.
            </p>
          </div>
          <div class="price">$44</div>
        </div>
        <div class="box lunch breakfast">
          <img src="images/tab-item-04.png" alt="" />
          <div class="info">
            <h2>Fresh Chicken Salad</h2>
            <p>
              Lorem ipsum dolor sit amet, consectetur koit adipiscing elit, sed
              do.
            </p>
          </div>
          <div class="price">$44</div>
        </div>
        <div class="box dunner breakfast">
          <img src="images/tab-item-05.png" alt="" />
          <div class="info">
            <h2>Dollma Pire</h2>
            <p>
              Lorem ipsum dolor sit amet, consectetur koit adipiscing elit, sed
              do.
            </p>
          </div>
          <div class="price">$44</div>
        </div>
        <div class="box lunch breakfast">
          <img src="images/tab-item-06.png" alt="" />
          <div class="info">
            <h2>Omelette & Cheese</h2>
            <p>
              Lorem ipsum dolor sit amet, consectetur koit adipiscing elit, sed
              do.
            </p>
          </div>
          <div class="price">$44</div>
        </div>
      </div>
    </section>
    <footer>
      <div class="container">
        <div class="icons">
          <i class="fab fa-facebook-f"></i>
          <i class="fab fa-twitter"></i>
          <i class="fab fa-instagram"></i>
          <i class="fab fa-youtube"></i>
        </div>
        <div class="logo">
          <a href="index.html">
            <img src="images/white-logo.png" alt="" />
          </a>
        </div>
        <div class="copyright">
          <p>&copy;copyright klassycafe co.</p>
        </div>
      </div>
    </footer>
    <script src="js/main.js"></script>
  </body>
</html>
