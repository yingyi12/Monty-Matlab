classdef View < handle
   
    properties  (Access = private)
        Gui
        Table
        Axis
        ImportButton
        ExportButton
    end

    methods  (Access = public)
        function obj = View
            obj.createLayout();
            set(obj.Gui,'Visible','on')
        end
        
    end
    
   
    methods (Access = private)
        function createLayout(obj)
             obj.Gui =figure('Name','Import/Export','Units','normalized');
               

             p1 = uipanel('Parent', obj.Gui,'Title','Import/Export','Position',[0, 0.8,1,0.2],'Units','normalized');
             
             obj.ImportButton = matlab.ui.control.UIControl('Parent',p1,'Units','normalized','Style', 'Pushbutton','String','Import','Position',[0, 0,0.45,1]);
             obj.ExportButton = matlab.ui.control.UIControl('Parent',p1, 'Units','normalized','Style', 'Pushbutton','String','Export','Position',[0.5, 0,0.45,1]);
             p2 = uipanel('Parent', obj.Gui,'Title','Data','Position',[0, 0,1,0.8],'Units','normalized' );
             obj.Table = uitable('Parent',p2,'Units','normalized','ColumnEditable',true(1,size(obj.Table,2)),'Position',[0, 0,0.3,1]);
             obj.Axis =  axes('Parent',p2,'Units','normalized','Position',[0.3, 0,0.7,1]);

        end
    end