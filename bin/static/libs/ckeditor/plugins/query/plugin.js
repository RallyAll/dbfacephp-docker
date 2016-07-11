(function() {
	CKEDITOR.plugins.add('query', {
		init: function(editor) {

			var path = this.path;

			/* button command */

			function addButtonCommand(buttonName, label, commandName) {
				editor.addCommand(commandName, new CKEDITOR.dialogCommand(commandName));
				editor.ui.addButton(buttonName, {
					label: label,
					command: commandName,
					icon: path + 'img/' + commandName + '.png'
				});
				CKEDITOR.dialog.add(commandName, path + commandName + '.js');
			}

			addButtonCommand('Query', 'Query Item', 'query');

			/* context menu */

			if (editor.addMenuItems) {
				editor.addMenuGroup('query');

				editor.addMenuItems({
					query: {
						label: 'Edit Query',
						command: 'query',
						group: 'query',
						icon: path + 'img/query.png'
					}
				});
			}

			if (editor.contextMenu) editor.contextMenu.addListener(function(element, selection) {
				if (element && element.is('img') && element.getAttribute('cke_query_script')) return {
					query: CKEDITOR.TRISTATE_OFF
				};	else return null;
			});

			/* double click */

			editor.on('doubleclick', function(ev) {
				var el = ev.data.element;
				if (el && el.is('img') && el.getAttribute('cke_query_script')) {
          ev.data.dialog = 'query';
				} else return null;
			});
		}
	});
})();