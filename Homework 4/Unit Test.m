classdef VectorSumTest < matlab.unittest.TestCase
    methods (TestClassSetup)
        function assumeFunctionOnPath(testCase)
            % Using an assumption within the test class setup, make sure 
            % the test methods are only called when the vectorSum function
            % is on Matlab path using exist().
            % >> doc matlab.unittest.qualifications.assumable
            status = exist('vectorSum');
            assumeEqual(testCase,status,6);
        end
    end
    
    methods (Test)
        
        function testSumSameLength(testCase)
            % Verify that the output of the function vectorSum follows the
            % function specification for input vectors of same length. 
            % Test the function output for input vector combinations
            % [1x3, 1x3], [1x3, 3x1], [3x1, 3x1], [3x1, 1x3]. One example 
            % per combination is enough (4 vectorSum calls in total).
            a = [1,2,3];
            b = [1;2;3];
            soll = a(:)+b(:);
            v1 = vectorSum(a,a);
            v2 = vectorSum(a,b);
            v3 = vectorSum(b,b);
            v4 = vectorSum(b,a);
            verifyEqual(testCase,v1,soll);
            verifyEqual(testCase,v2,soll);
            verifyEqual(testCase,v3,soll);
            verifyEqual(testCase,v4,soll);
        end
        
        function testWarningOnDifferentLength(testCase)
            % According to specification, the function should issue a warning,
            % when the input vectors are of same length but have different shape
            % (e.g. a column and a row vector). Verify that vectorSum follows
            % this specification using [verifyWarning] for inputs [1 2 3], [3; 2; 1]
            % and [verifyWarningFree] for inputs [1 2 3], [3 2 1] (two function calls
            % in total). Do not verify function output.
            a = [1,2,3];
            b = [3;2;1];
            c = [1,2,3];
            d = [3,2,1];
            verifyWarning(testCase,@() vectorSum(a,b),'monty:vectorSum:differentShape');
            verifyWarningFree(testCase,@() vectorSum(c,d));
        end
        
        function testOnlyOneWarning(testCase)
            % verifyWarning() is capable of checking if a specific warning was
            % issued. It can not, however, verify that no other warnings were issued.
            % To verify this, write a test using [verifyThat] and the constraint 
            % [matlab.unittest.constraints.IssuesWarnings] in order to check that
            % only one specific warning was issued. See the documentation for details
            % (input [doc matlab.unittest.constraints.IssuesWarnings] on console)
            % Use the constraint parameter 'WhenNargoutIs' in order to specify with how
            % many outputs the function under test should be called by verifyThat() and
            % verify that the results are correct using the constraint object property
            % "FunctionOutputs".
            % In this test, call vectorSum once with the arguments [1 2 3] and [4; 5; 6].
            import matlab.unittest.constraints.IssuesWarnings
           
            a = [1,2,3];
            b = [4;5;6];
            issue_object=IssuesWarnings({'monty:vectorSum:differentShape'},'WhenNargoutIs',1,'Exactly',true);
            verifyThat(testCase,@() vectorSum(a,b),issue_object);
            verifyEqual(testCase,issue_object.FunctionOutputs{1}, [5;7;9]);
        end
    end
end


