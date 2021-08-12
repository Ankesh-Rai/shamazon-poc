@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="container px-4 py-5 mx-auto">
            <div class="row d-flex justify-content-center">
                <div class="col-5">
                    <h4 class="heading">Shopping Bag</h4>
                </div>
                <div class="col-7">
                    <div class="row text-right">
                        <div class="col-4">
                            <h6 class="mt-2">Category</h6>
                        </div>
                        <div class="col-4">
                            <h6 class="mt-2">Quantity</h6>
                        </div>
                        <div class="col-4">
                            <h6 class="mt-2">Price</h6>
                        </div>
                    </div>
                </div>
            </div>
            
            @foreach($data['Products'] as $p)
            <div class="row d-flex justify-content-center border-top">
                <div class="col-5">
                    <div class="row d-flex">
                        <div class="book"> <img src="{{ asset('/images/shopping.jpg') }}" width="200" class="book-img"> </div>
                        <div class="my-auto flex-column d-flex pad-left">
                            <h6 class="mob-text">{{ $p->name; }}</h6>
                            <p class="mob-text">{{ $p->description; }}</p>
                        </div>
                    </div>
                </div>
                <div class="my-auto col-7">
                    <div class="row text-right">
                        <div class="col-4">
                            <p class="mob-text">{{ $p->product_category; }}</p>
                        </div>
                        <div class="col-4">
                            <div class="row d-flex justify-content-end px-3">
                                <p class="mb-0" id="cnt1">1</p>
                                <div class="d-flex flex-column plus-minus"> <span class="vsm-text plus">+</span> <span class="vsm-text minus">-</span> </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <h6 class="mob-text">{{ $p->currency; }} {{ $p->unit_price; }}</h6>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach


            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="row">
                            <div class="col-lg-12 mt-2">
                                <div class=" d-flex justify-content-between px-4">
                                    <p class="mb-1 text-left">Subtotal</p>
                                    <h6 class="mb-1 text-right">$00.00</h6>
                                </div>
                                <div class="d-flex justify-content-between px-4">
                                    <p class="mb-1 text-left">Shipping</p>
                                    <h6 class="mb-1 text-right">$00.00</h6>
                                </div>
                                <div class="d-flex justify-content-between px-4" id="tax">
                                    <p class="mb-1 text-left">Total (tax included)</p>
                                    <h6 class="mb-1 text-right">$00.00</h6>
                                </div> 
                            </div>
                            <div class="col-lg-12 mt-2">
                                <button class="btn-block btn-blue" style="float:right; "> 
                                    <span> <span id="checkout">Checkout</span> <span id="check-amt">$00.00</span> </span> 
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection