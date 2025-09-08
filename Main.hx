import Sys;

class Main {
	static function main() {
		Sys.println("Welcome to HAxis Beta Edition 3.25");
		Sys.println("Available Functions: ");
		Sys.println("Print command");
		Sys.println("Variables");
		Sys.println("Exit program");
		Sys.println("Import");
		Sys.println("Type 'help' for more info");

		var varName = "";
		var varValue = "";
		var mathImports = 0;
		var gameImports = 0;

		while (true) {
			Sys.println("Enter your code.");
			var code = StringTools.trim(Sys.stdin().readLine());

			switch (code) {
				case "":
					Sys.println("[ERROR] Enter a valid command.");

				case "println":
					var toPrintln = Sys.stdin().readLine();
					if (toPrintln == null) {
						Sys.println("Enter a valid command.");
					} else if (toPrintln == varName) {
						Sys.println('> $varValue');
					} else {
						Sys.println('> $toPrintln');
					}

				case "print":
					var toPrint = Sys.stdin().readLine();
					if (toPrint == null) {
						Sys.println("Enter a valid command.");
					} else if (toPrint == varName) {
						Sys.print('> $varValue ');
					} else {
						Sys.print('> $toPrint ');
					}

				case "var":
					Sys.println("Variable name: ");
					varName = Sys.stdin().readLine();
					if (varName == null || varName.length == 0) {
						Sys.println("Enter a valid command.");
					} else {
						Sys.println("Value? (Type is auto-inferred)");
						varValue = Sys.stdin().readLine();
						if (varValue == null) {
							Sys.println("Enter a valid value.");
						} else {
							Sys.println("Variable value set.");
						}
					}

				case "help":
					Sys.println("Current functions: ");
					Sys.println("Print text: ");
					Sys.println("print");
					Sys.println("Hi!");
					Sys.println("Print text with newline: ");
					Sys.println("println");
					Sys.println("Hi!");
					Sys.println("Create variables: ");
					Sys.println("var");
					Sys.println("VarName");
					Sys.println("Value");
					Sys.println("Print variables: ");
					Sys.println("print");
					Sys.println("VarName");
					Sys.println("Exit program: ");
					Sys.println("exit cmd");
					Sys.println("Error Number");
					Sys.println("Credits: credits");
					Sys.println("Multi-Line: multiline");
					Sys.println("Run: run");
					Sys.println("Imports: ");
					Sys.println("import");
					Sys.println("importName");
					Sys.println("To see import commands, type 'help? imports'");

				case "exit cmd":
					var exitCode = Std.parseInt(Sys.stdin().readLine());
					if (exitCode == null)
						exitCode = 0;
					Sys.println("Exiting program.");
					Sys.exit(exitCode);

				case "multiline":
					multiline();

				case "run":
					Sys.println("Running program...");
					main();

				case "help? imports":
					Sys.println("Import function 'math.rand', used in 'axis.math'");
					Sys.println("Import function 'axis.game', used in 'axis.game'");
					Sys.println("Import function 'axis.chance', used in 'axis.game'");

				case "import":
					Sys.println("Current imports: ");
					Sys.println("axis.math");
					Sys.println("axis.game");
					Sys.println("Enter an import: ");
					var importName = StringTools.trim(Sys.stdin().readLine());
					switch (importName) {
						case "axis.math":
							Sys.println("Import name 'axis.math' successfully imported");
							Sys.println("New command: 'math.rand'");
							mathImports++;
						case "axis.game":
							Sys.println("Import name 'axis.game' successfully imported");
							Sys.println("New command: 'axis.game'");
							Sys.println("New command: 'axis.chance'");
							gameImports++;
						case _:
							Sys.println("Unknown import.");
					}

				case "axis.game":
					if (gameImports == 0) {
						Sys.println("This command can only be used with the import 'axis.game'");
					} else {
						runGame();
					}

				case "axis.chance":
					if (gameImports == 0) {
						Sys.println("This command can only be used with the import 'axis.game'");
					} else {
						runChance();
					}

				case "math.rand":
					if (mathImports == 0) {
						Sys.println("This command can only be used with the import 'axis.math'");
					} else {
						rand();
					}

				case "credits":
					Sys.println("Credits to the creator, [Team Axis] and inspiration from The Vyra Lang. Coded in Haxe.");

				case _:
					Sys.println('[ERROR] Instance \'$code\' not found.');
			}
		}
	}

	static function rand() {
		Sys.println("Welcome to the Random Number Generator.");
		Sys.println("Please type in the maximum number.");
		var side = Sys.stdin().readLine();
		var sides = Std.parseInt(side);

		if (sides != null && sides > 0) {
			var result = Math.floor(Math.random() * sides) + 1;
			Sys.println('The number I got was $result.');
		} else {
			Sys.println("Enter a valid number.");
		}
	}

	static function runGame() {
		var randNum = Math.floor(Math.random() * 100) + 1;
		Sys.println("I have a random number in my mind.");
		Sys.println("Your goal is to guess it.");
		Sys.println("What do you think my number is?");
		Sys.println("Hint: The number is between 1-100");

		var attempts = 1;
		var isCorrect = false;

		while (!isCorrect) {
			var guessStr = Sys.stdin().readLine();
			var guess = Std.parseInt(guessStr);

			if (guess != null) {
				if (guess == randNum) {
					Sys.println('Correct! You got the number in $attempts attempts!');
					isCorrect = true;
				} else if (guess == 9999) {
					Sys.println('The number was $randNum.');
					Sys.println("Thanks for playing!");
					return;
				} else {
					Sys.println("Sorry, that is incorrect.");
					Sys.println("What do you think my number is?");
					Sys.println("To quit, just type the number 9999.");
					attempts++;
				}
			} else {
				Sys.println("Please enter a valid number.");
			}
		}
	}

	static function runChance() {
		Sys.println("Ranking different coding languages based on luck.");
		Sys.println("How does this work?");
		Sys.println("Well, there is a random number that decides what is good.");
		Sys.println("Here is the key: ");
		Sys.println("1: S+");
		Sys.println("2: S");
		Sys.println("3: A");
		Sys.println("4: B");
		Sys.println("5: C");
		Sys.println("6: D");
		Sys.println("7: F");
		Sys.println("What coding language do you give me?");

		var codinglang = Sys.stdin().readLine();
		var response = Math.floor(Math.random() * 3) + 1;

		switch (response) {
			case 1:
				Sys.println('Ooh, $codinglang, that\'s a widespread one.');
			case 2:
				Sys.println('$codinglang is really well-known.');
			case 3:
				Sys.println('Lots of people use $codinglang.');
		}

		var chance = Math.floor(Math.random() * 7) + 1;
		Sys.sleep(1.0);

		switch (chance) {
			case 1:
				Sys.println('I think $codinglang is S+ tier!');
			case 2:
				Sys.println('I think $codinglang is S tier!');
			case 3:
				Sys.println('I think $codinglang is A tier!');
			case 4:
				Sys.println('I think $codinglang is B tier.');
			case 5:
				Sys.println('I think $codinglang is C tier.');
			case 6:
				Sys.println('I think $codinglang is D tier.');
			case 7:
				Sys.println('I think $codinglang is F tier.');
		}
	}

	static function processMultiLineComments(input:String, currentlyInComment:Bool):{result:String, inComment:Bool} {
		var result = "";
		var i = 0;
		var inMultiLineComment = currentlyInComment;

		while (i < input.length) {
			if (inMultiLineComment) {
				if (i <= input.length - 4 && input.substring(i, i + 4) == "{:/}") {
					inMultiLineComment = false;
					i += 4;
				} else {
					i++;
				}
			} else {
				if (i <= input.length - 4 && input.substring(i, i + 4) == "{/:}") {
					inMultiLineComment = true;
					i += 4;
				} else if (i <= input.length - 2 && input.substring(i, i + 2) == "/:") {
					break;
				} else {
					result += input.charAt(i);
					i++;
				}
			}
		}

		return {result: StringTools.trim(result), inComment: inMultiLineComment};
	}

	static function removeComments(input:String):String {
		var commentStart = input.indexOf("/:");
		if (commentStart != -1) {
			if (commentStart == 0 || input.charAt(commentStart - 1) != "{") {
				input = input.substring(0, commentStart);
			}
		}
		return StringTools.trim(input);
	}

	static function parseStatement(statement:String):{command:String, args:Array<String>} {
		statement = removeComments(statement);
		statement = StringTools.trim(statement);

		if (statement == "") {
			return {command: "comment", args: []};
		}

		if (statement.indexOf("print(") == 0 || statement.indexOf("println(") == 0) {
			var isNewline = statement.indexOf("println(") == 0;
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var content = statement.substring(start, end);
				if ((content.charAt(0) == '"' && content.charAt(content.length - 1) == '"')
					|| (content.charAt(0) == "'" && content.charAt(content.length - 1) == "'")) {
					content = content.substring(1, content.length - 1);
				}
				return {command: isNewline ? "println" : "print", args: [content]};
			}
		}

		if (statement.indexOf("var ") == 0) {
			var parts = statement.substring(4).split("=");
			if (parts.length == 2) {
				var varName = StringTools.trim(parts[0]);
				var varValue = StringTools.trim(parts[1]);
				if (varValue.charAt(varValue.length - 1) == ";") {
					varValue = varValue.substring(0, varValue.length - 1);
				}
				if ((varValue.charAt(0) == '"' && varValue.charAt(varValue.length - 1) == '"')
					|| (varValue.charAt(0) == "'" && varValue.charAt(varValue.length - 1) == "'")) {
					varValue = varValue.substring(1, varValue.length - 1);
				}
				return {command: "var", args: [varName, varValue]};
			}
		}

		if (statement.indexOf("file.system.create(") == 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var content = statement.substring(start, end);
				var parts = [];
				var currentPart = "";
				var inQuotes = false;
				var quoteChar = "";
				var i = 0;

				while (i < content.length) {
					var char = content.charAt(i);
					if (!inQuotes && (char == '"' || char == "'")) {
						inQuotes = true;
						quoteChar = char;
						i++;
						continue;
					} else if (inQuotes && char == quoteChar) {
						inQuotes = false;
						quoteChar = "";
						i++;
						continue;
					} else if (!inQuotes && char == ",") {
						parts.push(StringTools.trim(currentPart));
						currentPart = "";
						i++;
						continue;
					}
					currentPart += char;
					i++;
				}

				if (currentPart.length > 0) {
					parts.push(StringTools.trim(currentPart));
				}

				return {command: "file.system.create", args: parts};
			}
		}

		if (statement.indexOf("file.system.rewrite(") == 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var content = statement.substring(start, end);
				var parts = [];
				var currentPart = "";
				var inQuotes = false;
				var quoteChar = "";
				var i = 0;

				while (i < content.length) {
					var char = content.charAt(i);
					if (!inQuotes && (char == '"' || char == "'")) {
						inQuotes = true;
						quoteChar = char;
						i++;
						continue;
					} else if (inQuotes && char == quoteChar) {
						inQuotes = false;
						quoteChar = "";
						i++;
						continue;
					} else if (!inQuotes && char == ",") {
						parts.push(StringTools.trim(currentPart));
						currentPart = "";
						i++;
						continue;
					}
					currentPart += char;
					i++;
				}

				if (currentPart.length > 0) {
					parts.push(StringTools.trim(currentPart));
				}

				return {command: "file.system.rewrite", args: parts};
			}
		}

		if (statement.indexOf("file.system.show(") == 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var fileName = StringTools.trim(statement.substring(start, end));
				if ((fileName.charAt(0) == '"' && fileName.charAt(fileName.length - 1) == '"')
					|| (fileName.charAt(0) == "'" && fileName.charAt(fileName.length - 1) == "'")) {
					fileName = fileName.substring(1, fileName.length - 1);
				}
				return {command: "file.system.show", args: [fileName]};
			}
		}

		if (statement.indexOf("math.random(") == 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var maxValue = StringTools.trim(statement.substring(start, end));
				return {command: "math.random", args: [maxValue]};
			}
		}

		if (statement.indexOf("list") == 0 && statement.indexOf("=") > 0) {
			var parts = statement.split("=");
			if (parts.length == 2) {
				var listContent = StringTools.trim(parts[1]);
				if (listContent.charAt(0) == "[" && listContent.charAt(listContent.length - 1) == "]") {
					listContent = listContent.substring(1, listContent.length - 1);

					var items = listContent.split(",");
					var cleanItems = [];
					for (item in items) {
						item = StringTools.trim(item);
						if ((item.charAt(0) == '"' && item.charAt(item.length - 1) == '"')
							|| (item.charAt(0) == "'" && item.charAt(item.length - 1) == "'")) {
							item = item.substring(1, item.length - 1);
						}
						cleanItems.push(item);
					}
					return {command: "list.make", args: cleanItems};
				}
			}
		}

		if (statement.indexOf("list.push(") == 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var item = StringTools.trim(statement.substring(start, end));
				if ((item.charAt(0) == '"' && item.charAt(item.length - 1) == '"')
					|| (item.charAt(0) == "'" && item.charAt(item.length - 1) == "'")) {
					item = item.substring(1, item.length - 1);
				}
				return {command: "list.add", args: [item]};
			}
		}

		if (statement.indexOf("if") == 0 && statement.indexOf("(") > 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.indexOf(")", start);
			if (end > start) {
				var condition = StringTools.trim(statement.substring(start, end));
				return {command: "if", args: [condition]};
			}
		}

		if (statement.indexOf("axis.sleep(") == 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var time = StringTools.trim(statement.substring(start, end));
				return {command: "sleep", args: [time]};
			}
		}

		if (statement.indexOf("axis.quit.forceExit(") == 0) {
			var start = statement.indexOf("(") + 1;
			var end = statement.lastIndexOf(")");
			if (end > start) {
				var exitCode = StringTools.trim(statement.substring(start, end));
				return {command: "forceExit", args: [exitCode]};
			}
		}

		switch (statement) {
			case "axis.run" | "axis.run;":
				return {command: "run", args: []};
			case "axis.wipe" | "axis.wipe;":
				return {command: "clear", args: []};
			case "axis.quit" | "axis.quit;":
				return {command: "quit", args: []};
			case "help" | "help;":
				return {command: "help", args: []};
			case "}":
				return {command: "block.end", args: []};
		}

		return {command: "unknown", args: [statement]};
	}

	static function multiline() {
		var statements = new Array<{command:String, args:Array<String>}>();
		var variables = new Map<String, String>();
		var fileContents = new Map<String, String>();
		var listItems = new Array<String>();
		var inMultiLineComment = false;
		var inIfBlock = false;
		var ifCondition = "";
		var ifStatements = new Array<{command:String, args:Array<String>}>();

		while (true) {
			var input = StringTools.trim(Sys.stdin().readLine());
			if (input == "")
				continue;

			var processedInput = processMultiLineComments(input, inMultiLineComment);
			inMultiLineComment = processedInput.inComment;

			if (processedInput.result == "")
				continue;

			var parsed = parseStatement(processedInput.result);

			switch (parsed.command) {
				case "comment":

				case "println":
					if (inIfBlock) {
						ifStatements.push(parsed);
					} else {
						statements.push(parsed);
					}

				case "print":
					if (inIfBlock) {
						ifStatements.push(parsed);
					} else {
						statements.push(parsed);
					}

				case "var":
					if (parsed.args.length >= 2) {
						variables.set(parsed.args[0], parsed.args[1]);
						if (inIfBlock) {
							ifStatements.push(parsed);
						} else {
							statements.push(parsed);
						}
					}

				case "math.random":
					if (inIfBlock) {
						ifStatements.push(parsed);
					} else {
						statements.push(parsed);
					}

				case "file.system.create":
					if (parsed.args.length >= 2) {
						try {
							var fileName = parsed.args[0];
							var content = parsed.args[1];
							var file = sys.io.File.write(fileName, false);
							file.writeString(content);
							file.close();
							fileContents.set(fileName, content);
							variables.set(fileName, content);
							Sys.println('[SYSTEM] File "$fileName" created successfully');
						} catch (e:Dynamic) {
							Sys.println('[ERROR] Failed to create file: $e');
						}
					}

				case "file.system.rewrite":
					if (parsed.args.length >= 2) {
						try {
							var fileName = parsed.args[0];
							var content = parsed.args[1];
							var file = sys.io.File.write(fileName, false);
							file.writeString(content);
							file.close();
							fileContents.set(fileName, content);
							variables.set(fileName, content);
							Sys.println('[SYSTEM] File "$fileName" rewritten successfully');
						} catch (e:Dynamic) {
							Sys.println('[ERROR] Failed to rewrite file: $e');
						}
					}

				case "file.system.show":
					if (parsed.args.length >= 1) {
						var filePath = parsed.args[0];
						try {
							var stat = sys.FileSystem.stat(filePath);

							var content = sys.io.File.getContent(filePath);

							var fileType = filePath.split(".").pop();

							var modDate = Date.fromTime(stat.mtime.getTime());
							var formattedDate = '${modDate.getDate()}/${modDate.getMonth() + 1}/${modDate.getFullYear()} ${modDate.getHours()}:${modDate.getMinutes()}:${modDate.getSeconds()}';

							var size = stat.size;
							var sizeStr = "";
							if (size < 1024)
								sizeStr = '$size B';
							else if (size < 1024 * 1024)
								sizeStr = '${Math.round(size / 1024 * 100) / 100} KB';
							else if (size < 1024 * 1024 * 1024)
								sizeStr = '${Math.round(size / 1024 / 1024 * 100) / 100} MB';

							Sys.println('\n[FILE INFORMATION]');
							Sys.println('Filename: $filePath');
							Sys.println('Type: .$fileType');
							Sys.println('Size: $sizeStr');
							Sys.println('Last Modified: $formattedDate');
							Sys.println('\n[CONTENT]');
							Sys.println(content);

							variables.set(filePath, content);
						} catch (e:Dynamic) {
							Sys.println('[ERROR] Failed to read file: $e');
						}
					} else {
						Sys.println("[ERROR] Usage: file.system.show(filename.txt)");
					}
					continue;

				case "list.make":
					listItems = parsed.args.copy();
					if (inIfBlock) {
						ifStatements.push(parsed);
					} else {
						statements.push(parsed);
					}

				case "list.add":
					if (parsed.args.length > 0) {
						listItems.push(parsed.args[0]);
						if (inIfBlock) {
							ifStatements.push(parsed);
						} else {
							statements.push(parsed);
						}
					}

				case "if":
					if (parsed.args.length > 0) {
						ifCondition = parsed.args[0];
						inIfBlock = true;
						ifStatements = new Array<{command:String, args:Array<String>}>();
					}

				case "block.end":
					if (inIfBlock) {
						inIfBlock = false;
						if (ifCondition == "true") {
							for (stmt in ifStatements) {
								statements.push(stmt);
							}
						}
						ifStatements = new Array<{command:String, args:Array<String>}>();
					}

				case "sleep":
					if (inIfBlock) {
						ifStatements.push(parsed);
					} else {
						statements.push(parsed);
					}

				case "help":
					Sys.println('print("text") or println("text") - Print text');
					Sys.println('var name = value - Create variable');
					Sys.println('math.random(max) - Generate random number');
					Sys.println('list = ["item1", "item2"] - Create list');
					Sys.println('list.push("item"); - Add to list');
					Sys.println('if (true) { ... } - Conditional program');
					Sys.println('axis.sleep(milliseconds) - Pause execution');
					Sys.println('file.system.create("filename", "content") - Create file');
					Sys.println('file.system.rewrite("filename", "content") - Rewrite file');
					Sys.println('file.system.show("filename") - Show file info and content');
					Sys.println('axis.run - Execute all statements');
					Sys.println('axis.wipe - Clear all statements');
					Sys.println('axis.quit - Return to main menu');
					Sys.println('axis.quit.forceExit(errorCode) - Force exit program');
					Sys.println('/: comment - Single line comment');
					Sys.println('{/:} \nmultiline \ncomment \n{:/} - Multiline comment');

				case "run":
					Sys.println("Executing program...");
					for (stmt in statements) {
						executeStatement(stmt, variables, listItems);
					}

				case "clear":
					statements = new Array<{command:String, args:Array<String>}>();
					variables = new Map<String, String>();
					listItems = new Array<String>();
					Sys.println("All statements cleared.");

				case "quit":
					Sys.println("Exiting multiline mode...");
					return;

				case "forceExit":
					var exitCode = 0;
					if (parsed.args.length > 0) {
						var code = Std.parseInt(parsed.args[0]);
						if (code != null)
							exitCode = code;
					}
					Sys.println("Force Exiting...");
					Sys.exit(exitCode);

				case "unknown":
					if (parsed.args[0] != "") {
						Sys.println('[ERROR] Unknown syntax: ${parsed.args[0]}');
					}
			}
		}
	}

	static function executeStatement(stmt:{command:String, args:Array<String>}, variables:Map<String, String>, listItems:Array<String>) {
		switch (stmt.command) {
			case "println":
				var output = stmt.args[0];
				if (variables.exists(output)) {
					output = variables.get(output);
				}
				Sys.println('> $output');

			case "print":
				var output = stmt.args[0];
				if (variables.exists(output)) {
					output = variables.get(output);
				}
				Sys.print('> $output ');

			case "var":

			case "math.random":
				if (stmt.args.length > 0) {
					var max = Std.parseInt(stmt.args[0]);
					if (max != null && max > 0) {
						var result = Math.floor(Math.random() * max) + 1;
						Sys.println('> $result');
					}
				}

			case "list.make":
				Sys.println('> [${listItems.join(", ")}]');

			case "list.add":
				Sys.println('> [${listItems.join(", ")}]');

			case "sleep":
				if (stmt.args.length > 0) {
					var sleepTime = Std.parseInt(stmt.args[0]);
					if (sleepTime != null && sleepTime > 0) {
						Sys.println('[SYSTEM] Thread paused for $sleepTime ms');
						Sys.sleep(sleepTime / 1000.0);
						Sys.println("[SYSTEM] Thread resumed");
					}
				}
		}
	}
}
