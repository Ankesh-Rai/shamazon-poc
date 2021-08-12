@extends('layouts.app')

@section('content')

<div class="col-lg-12">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="col-md-12 mx-auto">
                <h3 class="text-center">Product Details</h3>
                
                @if(Session::has('message'))
                <p class="alert {{ Session::get('alert-class', 'alert-info') }}">{{ Session::get('message') }}</p>
                @endif

                <table class="table table-striped view-product">
                    <thead>
                        <tr>
                        <th scope="col">#</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Unit Price</th>
                        <th scope="col">Currency</th>
                        <th scope="col">Available Quantity</th>
                        <th scope="col">Description</th>
                        <th scope="col">Product Category</th>
                        <th scope="col">Status</th>
                        <th scope="col">Added On</th>
                        <th scope="col" class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $i = 1;
                        @endphp
                        @foreach($data['Products'] as $p)
                        <tr>
                            <th scope="row">{{$i++}}</th>
                            <td>{{ $p->name }}</td>
                            <td>{{ $p->unit_price }}</td>
                            <td>{{ $p->currency }}</td>
                            <td>{{ $p->available_quantity }}</td>
                            <td>{{ $p->description }}</td>
                            <td>{{ $p->product_category }}</td>
                            <td>{{ $p->status }}</td>
                            <td>{{ $p->added_on }}</td>
                            <td>
                                <a class="btn btn-success" href="add-update-product/{{$p->id}}">Edit</a>
                                <a class="btn btn-danger" href="delete-product/{{$p->id}}">delete</a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
   </div>
</div>
@endsection