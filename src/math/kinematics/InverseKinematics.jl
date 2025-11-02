abstract type IKAlgorithm end

struct Newton <: IKAlgorithm
    x_0::Float64
    tol::Float64 
end

struct GradientDescent<: IKAlgorithm end

struct CCD <: IKAlgorithm end

struct FABRIK <: IKAlgorithm end

"""
    # Description
    Computes a robots joint positions given
    a desired end effector pose.

    # Arguments
    - ee_pose: Desired end effector pose
    - x_0: initial guess
    - tol: tolerance for the algorithm
    - alg: Inverse kinematics algorithm
"""
function ik(robot, ee_pose, alg::Newton)
    
end

function ik(robot, ee_pose, alg::CCD)
    
end

function ik(robot, ee_pose, alg::FABRIK)
    
end