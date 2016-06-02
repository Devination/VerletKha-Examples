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
		world = new Verlet(800, 600);
		// Render Verlet world
		verletRenderer = Renderer.Instance;
		
		// Entities
		var tire:Tire = new Tire(new Vector2(170,-32), 64, 32, .05, .5);
		
		// Colliders
		//Convex
		var poly = new Polygon(new Vector2(0, 0), [new Vector2(0, 0),new Vector2(100, -100), new Vector2(200, 0), new Vector2(150, 150), new Vector2(20, 100)]);
		poly.pos.x = 20;
		poly.pos.y = 300;
		//Concave
		poly = new Polygon (
			new Vector2(0, 0),
			[
				new Vector2(0, 0),
				new Vector2(0, -200),
				new Vector2(50, -200),
				new Vector2(150, -50),
				new Vector2(300, -200),
				new Vector2(350, -200),
				new Vector2(350, 100)
			]
		);
		//poly.renderNormals = true;
		poly.pos.x = 250;
		poly.pos.y = 550;
		
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