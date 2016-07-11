CKEDITOR.dialog.add('query', function(editor) {
	return {
		title: 'Query Script Item',
		minWidth: 350,
		minHeight: 100,

		onShow: function () {
      this.curelement = editor.getSelection().getStartElement();
      if (this.curelement.is("img") && this.curelement.getAttribute('cke_query_script')) {
      } else {
        this.curelement = null;
      }
			this.setupContent(this.curelement);
		},

		onOk: function () {
			var area = this.getValueOf('info', 'area').replace(/\"/g, "");
			var zoom = this.getValueOf('info', 'zoom');
			var width = this.getValueOf('info', 'width');
			var height = this.getValueOf('info', 'height');
      if (this.curelement == null) {
        var s = '<img'
          + ' src ="' + CKEDITOR.plugins.get("query").path + 'img/block.png"'
          + ' title="' + area + '"'
          + ' class="ck_query_img"'
          + ' cke_query_script ="' + area + '"'
          + ' cke_query_style ="' + zoom + '"'
          + ' cke_query_width="' + width + '"'
          + ' cke_query_height="' + height + '"'
          + ' style="cursor: pointer;width:' + width+';height:' +height+'"'
          + '/>';
        editor.insertHtml(s, 'unfiltered_html');
      } else {
        this.curelement.setAttribute('cke_query_script', area);
        this.curelement.setAttribute('cke_query_style', zoom);
        this.curelement.setAttribute('cke_query_width', width);
        this.curelement.setAttribute('cke_query_height', height);
        this.curelement.setAttribute('title', area);
        this.curelement.setAttribute('class', 'ck_query_img');
        this.curelement.setAttribute('style', "width:"+width+";height:"+height);
      }
		},

		contents: [{
			id: 'info',
			label: 'Query Item',
			title: 'Query Item',
			elements: [
				{
					id: 'area',
					label: 'Script',
					type: 'textarea',
					setup: function(element) {
            if (element) {
						  this.setValue(element.getAttribute('cke_query_script'));
            }
					}
				},
				{
					id: 'zoom',
					label: 'Display',
					type: 'select',
					setup: function(element) {
            if (element) {
						  this.setValue(element.getAttribute('cke_query_style'));
            }
					},
					labelLayout: 'horizontal',
					'default': 'table',
					items: [
						['General Table', 'table'],
						['Bordered Table', 'table table-bordered'],
						['Condensed Table', 'table table-condensed'],
            ['Striped Table', 'table table-striped'],
            ['Hover Table', 'table table-hover'],
            ['Single Text', 'singlevalue']
					]
				},
				{
					id: 'width',
					label: 'Width',
					type: 'text',
					setup: function(element) {
            if (element) {
						  this.setValue(element.getAttribute('cke_query_width'));
            }
					},
					labelLayout: 'horizontal',
					width: '80px',
					'default': '100%'
				},
				{
					id: 'height',
					label: 'Height',
					type: 'text',
					setup: function(element) {
            if (element) {
						  this.setValue(element.getAttribute('cke_query_height'));
            }
					},
					labelLayout: 'horizontal',
					width: '80px',
					'default': '100%'
				}
			]
		}]
	};
});