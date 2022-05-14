import { Controller } from '@hotwired/stimulus';
import * as THREE from 'three'
import { STLLoader } from 'three/examples/jsm/loaders/STLLoader'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'

export default class extends Controller {
  static targets = ["scene"]

  initialize() {
    this.stlObject = null
    this.color = 0xDDDDDD
  }

  connect() {
    this.scene = new THREE.Scene();

    this.setCamera(-120, 100, 100)

    this.setHelpers()

    this.setLight(50, 50, 50)
    this.setLight(-50, 50, -50)
    this.setLight(-50, -50, 50)

    this.setAmbientLight()

    this.renderer = new THREE.WebGLRenderer()
    this.renderer.setSize(window.innerWidth / 2, window.innerHeight / 2)
    this.controls = new OrbitControls(this.camera, this.renderer.domElement);

    const animate = () => {
      requestAnimationFrame(animate)
      if (this.stlObject) {
        this.stlObject.rotation.z += 0.005
      }
      this.controls.update()
      this.renderer.render(this.scene, this.camera);
    }

    this.sceneTarget.appendChild(this.renderer.domElement)
    animate()
  }

  setLight(x, y, z) {
    const pointLight = new THREE.PointLight(0xFFFFFF)
    pointLight.position.set(x, y, z)
    this.scene.add(pointLight)

    const lightHelper = new THREE.PointLightHelper(pointLight)
    this.scene.add(lightHelper)
  }

  setAmbientLight() {
    const light = new THREE.AmbientLight(0x404040)
    this.scene.add(light)
  }

  setHelpers() {
    const axesHelper = new THREE.AxesHelper(50);
    this.scene.add(axesHelper);

    const gridHelper = new THREE.GridHelper(200, 50)
    this.scene.add(gridHelper)
  }

  setCamera(x, y, z) {
    this.camera = new THREE.PerspectiveCamera(45, window.innerWidth / window.innerHeight, 0.1, 1000);
    this.camera.position.set(x, y, z)
  }

  setColor({ params: { color } }) {
    if (!this.stlObject) return

    this.color = `0x${color}`
    this.stlObject.material.color.setHex(this.color)
  }

  onDropFile(event) {
    const stlFile = event.target.files[0]
    const reader = new FileReader()
    this.scene.remove(this.stlObject)
    reader.addEventListener('load', (e) => {
      const contents = e.target.result
      const geometry = new STLLoader().parse(contents);
      const material = new THREE.MeshStandardMaterial({ color: parseInt(this.color) })
      this.stlObject = new THREE.Mesh(geometry, material)
      this.stlObject.rotateX(-Math.PI / 2)
      this.scene.add(this.stlObject)
    }, false);
    if (reader.readAsBinaryString !== undefined) {
      reader.readAsBinaryString(stlFile)
    } else {
      reader.readAsArrayBuffer(stlFile)
    }
  }
}
