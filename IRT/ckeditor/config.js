/*
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	//config.language = 'es';
	// config.uiColor = '#AADC6E';
    config.extraPlugins = 'button';
    config.extraPlugins = 'menubutton';
    config.extraPlugins = 'htmlbuttons';
    config.htmlbuttons = [
        {
            name: 'button1',          
            html: '[IMAGEN1]',
            title: 'Imagen 1',            
            label: 'Imagen 1'
        },
        {
            name: 'button2',
            html: '[IMAGEN2]',
            title: 'Imagen 2',
            label: 'Imagen 2'
        }
        ,
        {
            name: 'button3',
            html: '[IMAGEN3]',
            title: 'Imagen 3',
            label: 'Imagen 3'
        }
        ,
        {
            name: 'button4',
            html: '[IMAGEN4]',
            title: 'Imagen 4',
            label: 'Imagen 4'
        }
        ,
        {
            name: 'button5',
            html: '[IMAGEN5]',
            title: 'Imagen 5',
            label: 'Imagen 5'
        }
        ,
        {
            name: 'button6',
            html: '[IMAGEN6]',
            title: 'Imagen 6',
            label: 'Imagen 6'
        }
        ,
        {
            name: 'button7',
            html: '[IMAGEN7]',
            title: 'Imagen 7',
            label: 'Imagen 7'
        }
        ,
        {
            name: 'button8',
            html: '[IMAGEN8]',
            title: 'Imagen 8',
            label: 'Imagen 8'
        }
    ];

    config.toolbar = 'Full';

    config.toolbar_Full =
        [
            { name: 'document', items: ['Source','Templates'] },
            { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'] },
            { name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-', 'SpellChecker', 'Scayt'] },
            {
                name: 'forms', items: []
            },
            '/',
            { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'] },
            {
                name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv',
                    '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
            },
            { name: 'links', items: ['Link', 'Unlink', 'Anchor'] },
            { name: 'insert', items: ['Image',  'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe'] },
            '/',
            { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] },
            { name: 'colors', items: ['TextColor', 'BGColor'] },
            { name: 'misimagenes', items: ['button1', 'button2', 'button3', 'button4', 'button5', 'button6', 'button7', 'button8'] },
            { name: 'tools', items: ['Maximize', 'ShowBlocks', '-', 'About'] }
        ];
};




