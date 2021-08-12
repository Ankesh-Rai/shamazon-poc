@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="col-md-6 mx-auto">
                <h3 class="text-center">{{$data["Products"]->id ? 'Update ' : 'Add '}} Product Details</h3>
                <hr>

                @if(Session::has('message'))
                <p class="alert {{ Session::get('alert-class', 'alert-info') }}">{{ Session::get('message') }}</p>
                @endif

                {{ Form::model([$data['Products'], 'method' => 'POST']) }}
                    {{ Form::hidden('id', $data["Products"]->id, array('class' => '')) }}

                        {{ Form::label('name', 'Product Name', array('class' => '')) }}
                        {{ Form::text('name', $data["Products"]->name, array('class' => 'form-control', 'required' => 'required')) }}

                        {{ Form::label('unit_price', 'Unit Price', array('class' => '')) }}
                        {{ Form::number('unit_price', $data["Products"]->unit_price, array('class' => 'form-control', 'required' => 'required')) }}

                        {{ Form::label('currency', 'Currency', array('class' => '')) }}
                        {{ Form::text('currency', $data["Products"]->status, array('class' => 'form-control', 'required' => 'required', 'maxlength' => '10') ) }}

                        {{ Form::label('available_quantity', 'Available Quantity', array('class' => '')) }}
                        {{ Form::number('available_quantity', $data["Products"]->available_quantity, array('class' => 'form-control', 'required' => 'required')) }}
                    
                        {{ Form::label('description', 'Product Description', array('class' => '')) }}
                        {{ Form::textarea('description', $data["Products"]->description, array('class' => 'form-control', 'rows' => '5', 'required' => 'required')) }}
                    
                        {{ Form::label('product_category', 'Product Category', array('class' => '')) }}
                        {{ Form::number('product_category', $data["Products"]->product_category, array('class' => 'form-control', 'required' => 'required')) }}

                        {{ Form::label('status', 'Status', array('class' => '')) }}
                        {{ Form::number('status', $data["Products"]->status, array('class' => 'form-control', 'required' => 'required')) }}
                    
                    <div class="col-md-12 mt-3 mx-auto">
                        {{ Form::submit($data["Products"]->id ? 'Update Product' : 'Add Product', array('class' => $data["Products"]->id ? 'form-control btn btn-danger' : 'form-control btn btn-success')) }}
                    </div>
                {{ Form::close() }}
            </div>
        </div>
    </div>
</div>
@endsection