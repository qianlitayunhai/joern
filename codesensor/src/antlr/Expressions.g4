grammar Expressions;

expr: assign_expr (',' assign_expr)?;
assign_expr: conditional_expression (assignment_operator assign_expr)?;
conditional_expression: or_expression ('?' expr ':' conditional_expression)?;
or_expression : and_expression ('||' or_expression)?;
and_expression : inclusive_or_expression ('&&' and_expression)?;
inclusive_or_expression: exclusive_or_expression ('|' inclusive_or_expression)?;
exclusive_or_expression: bit_and_expression ('^' exclusive_or_expression)?;
bit_and_expression: equality_expression ('&' bit_and_expression)?;
equality_expression: relational_expression (equality_operator equality_expression)?;
relational_expression: shift_expression (relational_operator relational_expression)?;
shift_expression: additive_expression ( ('<<'|'>>') shift_expression)?;
additive_expression: multiplicative_expression (('+'| '-') additive_expression)?;
multiplicative_expression: cast_expression ( ('*'| '/'| '%') cast_expression)?;

cast_expression: ('(' type_name ptr_operator* ')' cast_expression)
    | unary_expression
    ;

unary_expression: postfix_expression
                | '--' unary_expression
                | '++' unary_expression
                | (unary_operator+ postfix_expression)
;

postfix_expression: field #fieldOnly
		  | field function_call_tail #funcCall
		  ;

field: (primary_expression postfix*);

function_call_tail: call_template_list function_argument_list
                  | function_argument_list
                  ;

call_template_list: ('<' template_param_list '>' );

function_argument_list: '(' ( function_argument (',' function_argument)* )? ')';
function_argument: assign_expr;

postfix: ('.' identifier
       	 | '->' identifier
       	 | '[' expr ']')
         | '++'
         | '--'
;

primary_expression: ('(' expr ')' | identifier | constant);
