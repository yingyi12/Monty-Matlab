testCase = TestCase;

% 1. Create a mock and a behavior object for the database interface and
% assign them to variables database and databaseBehavior. Make sure
% the mock object has the methods specified in task description.
import matlab.mock.actions.*

[database, databaseBehavior] = testCase.createMock('AddedMethods', {'connect', 'getUser'});

% 2. Define the behavior of the connect method. Hint: multiple calls to
%    assignOutputsWhen() might be required.
testCase.assignOutputsWhen(withAnyInputs(databaseBehavior.connect), false);

testCase.assignOutputsWhen(databaseBehavior.connect('FacultyMemberDB'), true);

% 3. Define the behavior of the getUser method
when(withAnyInputs(databaseBehavior.getUser),  ThrowException(MException('monty:db:undefined','Behavior not defined.')));



testCase.assignOutputsWhen(databaseBehavior.getUser(1), 'Mr. Pickles');

testCase.assignOutputsWhen(databaseBehavior.getUser(2), '');



when(databaseBehavior.getUser(3),Invoke(@(~,~)invoke_function()))
function y = invoke_function()
    warning('monty:db:connectionLost', 'Connection was lost.');
    y = '';
end

