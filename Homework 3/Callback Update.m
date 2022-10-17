% Copy your View code from exercise 3.2 and add all four callbacks
classdef View <handle
   properties (Access = public)
     hp1
     hp2
     Gui
     Axis
     Table
     ImportButton
     ExportButton
     Listener 
   end
   properties (Access = public, SetObservable, AbortSet)
     Data
   end
   methods (Access = public)
      function obj = View()
      %turn the GUIs visibility on 
        obj.createLayout();
        set(obj.Gui, 'Visible', 'On');
        obj.Data = Data();
        obj.Listener = addlistener(obj.Data, 'DataMatrix', 'PostSet', @obj.cbUpdate);
      end 
      function cbImport(obj, ~, ~)
         fileName = uigetfile('*.txt');
         obj.Data.importData(fileName);
         obj.cbUpdate()
      end
      function cbExport(obj, ~, ~)
         fileName = uiputfile('*.txt');
         obj.Data.exportData(fileName);
      end
      function cbEdit(obj, ~, ~)
         obj.Data.DataMatrix = obj.Table.Data;
      end
      function cbUpdate(obj, ~, ~)
      % Update table data
         obj.Table.Data = obj.Data.DataMatrix;
         obj.Table.RowName = obj.Data.TimeVector;
       % Update axis
         hold off
         plot(obj.Axis, obj.Data.TimeVector, obj.Table.Data(:,1));
         hold on
         plot(obj.Axis, obj.Data.TimeVector, obj.Table.Data(:,2));
       end
   end
   methods (Access = private)
      function createLayout(obj)
      % figure
         obj.Gui = figure('Name', 'Import/Export','Position', [300 200 600 500],'NumberTitle', 'off','toolbar', 'none','Menubar', 'none');
      % - Import/ Export panel
         obj.hp1 = uipanel('Position', [0.05 0.9 0.9 0.10],'Title', 'Import/Export','Parent', obj.Gui);
      % --- push button left
         obj.ImportButton = matlab.ui.control.UIControl('Style', 'pushbutton','String', 'Import','Units', 'normalized','Position', [0.05 0.05 0.45 0.9],'parent', obj.hp1,'Callback', @obj.cbImport);
    % --- push button right
         obj.ExportButton = matlab.ui.control.UIControl('Style', 'pushbutton','String', 'Export','Units', 'normalized','Position', [0.5 0.05 0.45 0.9],'parent', obj.hp1,'Callback', @obj.cbExport);
      % - Import/ Export panel
         obj.hp2 = uipanel('Position', [0.05 0.05 0.9 0.85],'Title', 'Data','Parent', obj.Gui);
      % - Table
         obj.Table = uitable('Units', 'normalized','Data', obj.Table,'Position', [0.05 0.05 0.35 0.9],'ColumnEditable', true,'parent', obj.hp2,'CellEditCallback', @obj.cbEdit);
      %- Axis
         obj.Axis = axes('Units', 'normalized','Position', [0.55 0.05 0.55 0.90],'Parent', obj.hp2);
      end
   end
end