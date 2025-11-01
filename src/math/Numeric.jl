module Numeric
    
function NewtonRasphson(f, fp, x0, tol=1e-6, max_iter=100)
    x_curr = x0

    for i = 1:max_iter
        # Computer f(x)
        f_x = f(x_curr)
        f_p_x = fprime(x_curr)

        # Check for zero derivative
        if f_prime_x == 0
            return 0
        end

        x_next = x_curr - f_x / f_p_x

        # Check for convergence
        if abs(x_next - x_curr) < tol
            return x_next
        end

        x_curr = x_next

    end
end

function NewtonRasphson_pinv()
    J = []
    J_pinv = pinv(J)

end

function CCD(joints, k)
    # q = configuration
    for i=1:k 
        q_curr = q_prev

        for j in joints 
            q_
            
        end
    end
end

end