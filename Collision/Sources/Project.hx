package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.math.Vector2;
import verlet.Objects.Tire;
import verlet.Verlet;
import verlet.Renderer;
import verlet.collision.Colliders;

class Project {
	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		new Verlet(800, 600);
		
		// Entities
		new Tire(new Vector2(500,32), 64, 32, .05, .5);
		
		// Colliders
		new Circle(new Vector2(222, 200), 256);
		new Circle(new Vector2(666, 300), 128);
		new Circle(new Vector2(400, 600), 128);
		new Box(new Vector2(200, 200), 256, 80);
	}

	function update(): Void {
		Verlet._instance.update(10);
	}

	function render(framebuffer: Framebuffer): Void {		
		var graphics = framebuffer.g2;
		graphics.begin();
		Renderer._instance.renderAll(graphics);
		graphics.end();
	}
}
