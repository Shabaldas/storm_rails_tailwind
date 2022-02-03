// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "swiper/swiper-bundle.min.css"

// import * as THREE from 'three';


// const scene = new THREE.Scene();
// const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
// const renderer = new THREE.WebGLRenderer();
// renderer.setSize( window.innerWidth, window.innerHeight );
// document.body.appendChild( renderer.domElement );

// function load_prog(id) {console.log( JSON.stringify(stl_viewer.get_model_info(id)) );}
//     var stl_viewer=new StlViewer(
//       document.getElementById("stl_cont"),
//         {

//           model_loaded_callback:load_prog,
//           auto_resize: false,
//           auto_rotate: true
          
//         }
//     );

require("stylesheets/application.scss")
require("controllers")

// require("three/stl_viewer.min")
// require("three/webgl_detector")
// require("three/CanvasRenderer")
// require("three/OrbitControls")
// require("three/TrackballControls")
// require("three/Projector")
// require("three/three.min")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
