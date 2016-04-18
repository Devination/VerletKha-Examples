package;

import kha.System;

class Main {
	public static function main() {
		System.init("Project", 800, 600, function () {
			new Project();
		});
	}
}
