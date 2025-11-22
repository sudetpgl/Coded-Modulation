function [X,label] = get_ask(M) 
%GET_ASK Initialization of M-Amplitude-Shift-Keying (M-ASK) constellation.
%Outputs the points and the labels of an M-ASK constellation with unit
%average power.
%
% Inputs:
%   M:  Number of symbols in the ASK constellation
%
% Outputs:
%   X:      Vector of dimension 1xM containing the M symbols of the ASK
%           constellation
%   label:  Matrix of size Mxm containing the binary labels of the M ASK
%           symbols where m=log2(M)

X = zeros(1,M);
label = zeros(M,log2(M));
X_right = zeros(1, M/2);
B = 0;
A = zeros(1, M/2);


if mod(M, 2) == 0
   
   for  i = 1:M/2          % [-x3 -x2 -x1 x1 x2 x3] -> we look only to right side of the x-achse and flip  
      A(i) = (2*i-1);      % we look the x-achse's right side.
      B = B + A(i)^2;      % after we have found the vector for this we flip it and put a minus infront  of it.
   end
   
    x = sqrt(2/B);         % the each point is 2x far from each other  
                           % the right side becomes [x 3x 5x 7x ...] lenght is M/2
                           % we built this vector with the help of for loop
                           % but we cant use A(i) = x(2i-1) because x is
                           % undefined, therefore we calcute x in which we solve the equation (x^2(1 + 3^2 + 5^2 +7^2+...))/(M/2)
                        
   for i = 1:M/2
      A(i) = x*(2*i-1);
      X_right(i) = A(i);
   end

   X_left = -fliplr(X_right);

   X = [X_left, X_right];
 
else 
      error('M must be an even number');
end

  label = +modulation.get_gray_label(log2(M));

end 