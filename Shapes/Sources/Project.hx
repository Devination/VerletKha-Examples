package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.math.Vector2;
import verlet.Objects.Tire;
import verlet.Verlet;
import verlet.Renderer;

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
		new Tire(new Vector2(100,128), 64, 7, .1, .3);
		new Tire(new Vector2(350,64), 64, 32, .03, .5);
		new Tire(new Vector2(600,32), 50, 4, .2, .7);
	}

	function update(): Void {
		
		world.update(10);
	}

	function render(framebuffer: Framebuffer): Void {		
		var graphics = framebuffer.g2;
		graphics.begin();
		verletRenderer.render(graphics);
		graphics.end();
	}
}
