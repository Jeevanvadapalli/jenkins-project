<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NexusShop Premium</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --bg: #f8fafc;
    --primary: #0f172a;
    --accent: #2563eb;
    --card: #fff;
    --muted: #64748b;
    --radius: 16px;
}

* {
    box-sizing: border-box;
    transition: all .2s ease;
}

body {
    margin: 0;
    font-family: Inter;
    background: var(--bg);
    color: var(--primary);
}

/* HEADER */
header {
    position: sticky;
    top: 0;
    backdrop-filter: blur(10px);
    background: rgba(255,255,255,0.7);
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* HERO */
.hero {
    text-align: center;
    padding: 80px 20px;
    color: white;
    background: linear-gradient(135deg,#0f172a,#2563eb);
}

.hero h1 {
    font-size: 42px;
}

/* BUTTON */
.btn {
    padding: 10px 20px;
    border-radius: 999px;
    border: none;
    cursor: pointer;
}

.btn-primary {
    background: linear-gradient(135deg,#2563eb,#3b82f6);
    color: white;
}

/* GRID */
.grid {
    display: grid;
    gap: 20px;
    padding: 40px;
}

/* PRODUCTS */
.products {
    grid-template-columns: repeat(auto-fit,minmax(250px,1fr));
}

.product {
    background: white;
    border-radius: var(--radius);
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(0,0,0,0.08);
}

.product:hover {
    transform: translateY(-8px);
}

.product img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.product-body {
    padding: 15px;
}

.price {
    font-weight: bold;
}

.add-btn {
    width: 100%;
    background: var(--primary);
    color: white;
    padding: 10px;
    border: none;
    border-radius: 8px;
}

/* TOAST */
.toast {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: black;
    color: white;
    padding: 10px 20px;
    border-radius: 10px;
}
</style>
</head>

<body>

<header>
    <h2>NexusShop</h2>
    <div>🛒 <span id="cart">0</span></div>
</header>

<section class="hero">
    <h1>Premium Shopping Experience</h1>
    <button class="btn btn-primary">Shop Now</button>
</section>

<section class="grid products" id="products"></section>

<script>
const PRODUCTS = [
    {id:1,title:"iPhone 14",price:999,img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb"},
    {id:2,title:"MacBook",price:1999,img:"https://images.unsplash.com/photo-1593642632823"},
    {id:3,title:"Headphones",price:199,img:"https://images.unsplash.com/photo-1518449037947"},
];

let cart = 0;

function render(){
    const grid = document.getElementById("products");
    grid.innerHTML = "";

    PRODUCTS.forEach(p=>{
        grid.innerHTML += `
        <div class="product">
            <img src="${p.img}">
            <div class="product-body">
                <h4>${p.title}</h4>
                <div class="price">$${p.price}</div>
                <button class="add-btn" onclick="add(${p.id})">Add to Cart</button>
            </div>
        </div>`;
    });
}

function add(id){
    cart++;
    document.getElementById("cart").innerText = cart;
    showToast("Added to cart");
}

function showToast(msg){
    const t = document.createElement("div");
    t.className = "toast";
    t.innerText = msg;
    document.body.appendChild(t);
    setTimeout(()=>t.remove(),2000);
}

render();
</script>

</body>
</html>
