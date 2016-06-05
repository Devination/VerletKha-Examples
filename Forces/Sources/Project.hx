package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.math.Vector2;
import verlet.Objects.Tire;
import verlet.Objects.Point;
import verlet.Verlet;
import verlet.Renderer;
import verlet.collision.Colliders;
import kha.Color;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Project {
	var world:Verlet;
	var verletRenderer:Renderer;
	
	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		// Verlet World
		world = new Verlet(800, 600, true);
		world.gravity.y = 0;
		
		// Render Verlet world
		verletRenderer = Renderer.Instance;
		
		// Entities
		new Tire(new Vector2(100,128), 32, 7, .1, .3);
		
		// Colliders
		//small planet
		var circle = new Circle(new Vector2(100, 250), 50);
		circle = new Circle(new Vector2(100, 250), 250);
		circle.strength = -0.0001;
		circle.colliderColor = Color.fromBytes(118, 138, 183);
		//big planet
		circle = new Circle(new Vector2(800, 50), 100);
		circle = new Circle(new Vector2(800, 50), 450);
		circle.strength = -0.00015;
		circle.colliderColor = Color.fromBytes(118, 138, 183);
		//repulsor box
		var box = new Box(new Vector2(0, 500), 800, 200);
		box.strength = 0.001;
		box.colliderColor = Color.fromBytes(215, 105, 110);
		//repulsor poly
		var poly = new Polygon(new Vector2(0,0), [new Vector2(0,0),new Vector2(150,-200),new Vector2(300,0)]);
		poly.pos.x = 250;
		poly.pos.y = 500;
		poly.strength = 0.05;
		poly.colliderColor =  Color.fromBytes(215, 105, 110);
	}

	function update(): Void {
		world.update(10);
	}

	var debug = true;
	function render(framebuffer: Framebuffer): Void {		
		var graphics = framebuffer.g2;
		graphics.begin();
		verletRenderer.renderAll(graphics);
		graphics.color = Color.Red;
		debug = false;
		graphics.end();
	}
}