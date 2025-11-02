module TetherIK

include("./env/RobotTypes.jl")
include("./env/World.jl")
include("./env/Visualization.jl")
include("./math/kinematics/ForwardKinematics.jl")
include("./math/kinematics/InverseKinematics.jl")


# Export what users should access
export Robot, PlanarRobot, SpatialRobot
export PlanarManipulator, SpatialManipulator
export ik, fk
export viz_planar

end # module TetherIK