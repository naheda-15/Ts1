<div class="modal-header">
    <h5 class="modal-title" id="modelHeading">
        @lang('modules.invoices.payOffline')
    </h5>
    <button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span
            aria-hidden="true">×</span></button>
</div>
    <div class="modal-body">
        <div class="portlet-body">
            <x-form id="offline-payment" method="POST" class="ajax-form">
                <input type="hidden" name="invoiceID" value="{{$invoiceID}}">
                <div class="form-body">
                    <div class="row" id="addressDetail">
                        <div class="col-lg-12 col-md-12">
                            <x-forms.select class="select-picker" fieldId="offlineMethod" :fieldLabel="__('modules.invoices.paymentMethod')"
                                fieldName="offlineMethod" search="true">
                                <option value="all">@lang('modules.payments.offlineMethodMsg')</option>
                                @foreach($methods as $method)
                                    <option value="{{ $method->id }}">{{ mb_ucwords($method->name) }}</option>
                                @endforeach
                            </x-forms.select>
                        </div>
                        <div class="col-lg-12 col-md-12 mt-3 d-none" id="offline_description_div">
                            <div class="form-group c-inv-select mb-0">
                                <label class="f-14 text-dark-grey mb-12 text-capitalize w-100"
                                    for="usr">@lang('modules.invoices.paymentDescription')</label>
                                <p class="f-15" id="offline_description"></p>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <x-forms.file allowedFileExtensions="txt pdf doc xls xlsx docx rtf png jpg jpeg svg" class="mr-0 mr-lg-2 mr-md-2" :fieldLabel="__('app.receipt')"
                            fieldName="bill" fieldId="bill" :popover="__('messages.fileFormat.multipleImageFile')" />
                        </div>
                    </div>
                </div>
            </x-form>
        </div>
    </div>
    <div class="modal-footer">
        <x-forms.button-cancel data-dismiss="modal" class="border-0 mr-3">@lang('app.close')</x-forms.button-cancel>
        <x-forms.button-primary id="save-offline-payment" icon="check">@lang('app.save')</x-forms.button-primary>
    </div>

<script>
    $(".select-picker").selectpicker();

    $("#bill").dropify({
        messages: dropifyMessages
    });

    $('#save-offline-payment').click(function() {
        $.easyAjax({
            url: "{{ route('invoices.store_offline_payment') }}",
            container: '#offline-payment',
            type: "POST",
            redirect: true,
            file: true,
            data: $('#offline-payment').serialize()
        })
    });

    $('#offlineMethod').on('change', function()
    {
        const id = $(this).val();
        const url = "{{ route('invoices.offline_method_description').'?id=' }}"+id;

        $.easyAjax({
            url : url,
            type : "GET",
            success: function (response) {
                if (response.status == 'success') {
                    let description = nl2br(response.description);

                    if (description) {
                        $('#offline_description_div').removeClass('d-none');
                        $('#offline_description').html(description);
                    }
                    else{
                        $('#offline_description_div').addClass('d-none');
                    }
                }
            }
        });
    });
</script>
