module AluthgeSinhaBase

# abstract types to export:
export AbstractDataset,
    AbstractTabularDataset,
    AbstractHoldoutTabularDataset,
    AbstractFoldedTabularDataset,
    AbstractModel,
    AbstractClassifier,
    AbstractSingleLabelClassifier,
    AbstractSingleLabelBinaryClassifier,
    AbstractRegression,
    AbstractSingleLabelRegression,
    AbstractModelPerformance

# concrete types to export:
export HoldoutTabularDataset,
    ResampledHoldoutTabularDataset,
    SingleLabelBinaryLogisticClassifier,
    ModelPerformance

# functions to export:
export getdata, performance

include("abstracttypes.jl")
include("fakedata.jl")
include("formulas.jl")
include("labelcoding.jl")
include("linearmodels.jl")
include("modelevaluation.jl")
include("tabulardatasets.jl")
include("util.jl")
include("version.jl")

end # end module AluthgeSinhaBase
