##### Beginning of file

import Test
import DataFrames
import PredictMD

my_vector = Vector{Any}(5)
my_vector[1] = Cfloat(1.1)
my_vector[2] = Cfloat(2.2)
my_vector[3] = DataFrames.missing
my_vector[4] = Cfloat(4.4)
my_vector[5] = DataFrames.missing
Test.@test(eltype(my_vector) == Any)
my_vector_fixed = PredictMD.fix_type(my_vector)
Test.@test(eltype(my_vector_fixed) == Union{Cfloat, DataFrames.Missing})

Test.@test( PredictMD.fix_type(nothing) == nothing )

Test.@test( PredictMD.fix_type(3.14) == 3.14 )

dict_1 = Dict()
dict_1[Symbol(:x)] = Float64(1.1)
dict_1[Symbol(:y)] = Float64(2.2)
dict_1[Symbol(:z)] = Float64(3.3)
Test.@test(typeof(dict_1) <: Dict{Any, Any})
Test.@test(length(dict_1) == 3)

dict_2 = PredictMD.fix_type(dict_1)
Test.@test(typeof(dict_2) <: Dict{Symbol, Float64})
Test.@test(length(dict_2) == 3)
Test.@test(dict_1[:x] == 1.1)
Test.@test(dict_1[:y] == 2.2)
Test.@test(dict_1[:z] == 3.3)

dict_3 = PredictMD.fix_type(dict_2)
Test.@test(typeof(dict_3) <: Dict{Symbol, Float64})
Test.@test(length(dict_3) == 3)
Test.@test(dict_1[:x] == 1.1)
Test.@test(dict_1[:y] == 2.2)
Test.@test(dict_1[:z] == 3.3)

dict_4 = PredictMD.fix_type(dict_3)
Test.@test(typeof(dict_4) <: Dict{Symbol, Float64})
Test.@test(length(dict_4) == 3)
Test.@test(dict_1[:x] == 1.1)
Test.@test(dict_1[:y] == 2.2)
Test.@test(dict_1[:z] == 3.3)

Test.@test( PredictMD.fix_type(nothing) == nothing )
Test.@test( PredictMD.fix_type(nothing) == nothing )

vector_1 = []
push!(vector_1, Float64(1.0))
push!(vector_1, Float64(2.0))
push!(vector_1, Float64(3.0))
Test.@test(typeof(vector_1) <: Vector{Any})
Test.@test(length(vector_1) == 3)
Test.@test(size(vector_1) == (3,))

vector_2 = PredictMD.fix_type(vector_1)
Test.@test(typeof(vector_2) <: Vector{Float64})
Test.@test(length(vector_2) == 3)
Test.@test(size(vector_2) == (3,))
Test.@test(vector_1[1] == 1.0)
Test.@test(vector_1[2] == 2.0)
Test.@test(vector_1[3] == 3.0)

vector_3 = PredictMD.fix_type(vector_2)
Test.@test(typeof(vector_3) <: Vector{Float64})
Test.@test(length(vector_3) == 3)
Test.@test(size(vector_3) == (3,))
Test.@test(vector_1[1] == 1.0)
Test.@test(vector_1[2] == 2.0)
Test.@test(vector_1[3] == 3.0)

vector_4 = PredictMD.fix_type(vector_3)
Test.@test(length(vector_4) == 3)
Test.@test(size(vector_4) == (3,))
Test.@test(typeof(vector_4) <: Vector{Float64})
Test.@test(vector_1[1] == 1.0)
Test.@test(vector_1[2] == 2.0)
Test.@test(vector_1[3] == 3.0)

##############################################################################

array_1 = Array{Any}(2,3,4)
array_1[1,1,1] = Float64(10)
array_1[1,1,2] = Float64(20)
array_1[1,1,3] = Float64(30)
array_1[1,1,4] = Float64(40)
array_1[1,2,1] = Float64(50)
array_1[1,2,2] = Float64(60)
array_1[1,2,3] = Float64(70)
array_1[1,2,4] = Float64(80)
array_1[1,3,1] = Float64(90)
array_1[1,3,2] = Float64(100)
array_1[1,3,3] = Float64(110)
array_1[1,3,4] = Float64(120)
array_1[2,1,1] = Float64(130)
array_1[2,1,2] = Float64(140)
array_1[2,1,3] = Float64(150)
array_1[2,1,4] = Float64(160)
array_1[2,2,1] = Float64(170)
array_1[2,2,2] = Float64(180)
array_1[2,2,3] = Float64(190)
array_1[2,2,4] = Float64(200)
array_1[2,3,1] = Float64(210)
array_1[2,3,2] = Float64(220)
array_1[2,3,3] = Float64(230)
array_1[2,3,4] = Float64(240)
Test.@test(typeof(array_1) <: Array{Any, 3})
Test.@test(length(array_1) == 24)
Test.@test(size(array_1) == (2,3,4,))

array_2 = PredictMD.fix_type(array_1)
Test.@test(typeof(array_2) <: Array{Float64, 3})
Test.@test(length(array_2) == 24)
Test.@test(size(array_2) == (2,3,4,))
Test.@test(array_2[1,1,1] == 10)
Test.@test(array_2[1,1,2] == 20)
Test.@test(array_2[1,1,3] == 30)
Test.@test(array_2[1,1,4] == 40)
Test.@test(array_2[1,2,1] == 50)
Test.@test(array_2[1,2,2] == 60)
Test.@test(array_2[1,2,3] == 70)
Test.@test(array_2[1,2,4] == 80)
Test.@test(array_2[1,3,1] == 90)
Test.@test(array_2[1,3,2] == 100)
Test.@test(array_2[1,3,3] == 110)
Test.@test(array_2[1,3,4] == 120)
Test.@test(array_2[2,1,1] == 130)
Test.@test(array_2[2,1,2] == 140)
Test.@test(array_2[2,1,3] == 150)
Test.@test(array_2[2,1,4] == 160)
Test.@test(array_2[2,2,1] == 170)
Test.@test(array_2[2,2,2] == 180)
Test.@test(array_2[2,2,3] == 190)
Test.@test(array_2[2,2,4] == 200)
Test.@test(array_2[2,3,1] == 210)
Test.@test(array_2[2,3,2] == 220)
Test.@test(array_2[2,3,3] == 230)
Test.@test(array_2[2,3,4] == 240)

array_3 = PredictMD.fix_type(array_2)
Test.@test(typeof(array_3) <: Array{Float64, 3})
Test.@test(length(array_3) == 24)
Test.@test(size(array_3) == (2,3,4,))
Test.@test(array_3[1,1,1] == 10)
Test.@test(array_3[1,1,2] == 20)
Test.@test(array_3[1,1,3] == 30)
Test.@test(array_3[1,1,4] == 40)
Test.@test(array_3[1,2,1] == 50)
Test.@test(array_3[1,2,2] == 60)
Test.@test(array_3[1,2,3] == 70)
Test.@test(array_3[1,2,4] == 80)
Test.@test(array_3[1,3,1] == 90)
Test.@test(array_3[1,3,2] == 100)
Test.@test(array_3[1,3,3] == 110)
Test.@test(array_3[1,3,4] == 120)
Test.@test(array_3[2,1,1] == 130)
Test.@test(array_3[2,1,2] == 140)
Test.@test(array_3[2,1,3] == 150)
Test.@test(array_3[2,1,4] == 160)
Test.@test(array_3[2,2,1] == 170)
Test.@test(array_3[2,2,2] == 180)
Test.@test(array_3[2,2,3] == 190)
Test.@test(array_3[2,2,4] == 200)
Test.@test(array_3[2,3,1] == 210)
Test.@test(array_3[2,3,2] == 220)
Test.@test(array_3[2,3,3] == 230)
Test.@test(array_3[2,3,4] == 240)

array_4 = PredictMD.fix_type(array_3)
Test.@test(typeof(array_4) <: Array{Float64, 3})
Test.@test(length(array_4) == 24)
Test.@test(size(array_4) == (2,3,4,))
Test.@test(array_4[1,1,1] == 10)
Test.@test(array_4[1,1,2] == 20)
Test.@test(array_4[1,1,3] == 30)
Test.@test(array_4[1,1,4] == 40)
Test.@test(array_4[1,2,1] == 50)
Test.@test(array_4[1,2,2] == 60)
Test.@test(array_4[1,2,3] == 70)
Test.@test(array_4[1,2,4] == 80)
Test.@test(array_4[1,3,1] == 90)
Test.@test(array_4[1,3,2] == 100)
Test.@test(array_4[1,3,3] == 110)
Test.@test(array_4[1,3,4] == 120)
Test.@test(array_4[2,1,1] == 130)
Test.@test(array_4[2,1,2] == 140)
Test.@test(array_4[2,1,3] == 150)
Test.@test(array_4[2,1,4] == 160)
Test.@test(array_4[2,2,1] == 170)
Test.@test(array_4[2,2,2] == 180)
Test.@test(array_4[2,2,3] == 190)
Test.@test(array_4[2,2,4] == 200)
Test.@test(array_4[2,3,1] == 210)
Test.@test(array_4[2,3,2] == 220)
Test.@test(array_4[2,3,3] == 230)
Test.@test(array_4[2,3,4] == 240)

##### End of file
