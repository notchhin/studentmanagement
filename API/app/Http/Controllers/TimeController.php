<?php

namespace App\Http\Controllers;

use Throwable;
use App\Models\Time;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class TimeController extends Controller
{

    public function list(Request $request)
    {
        abort_if(Gate::denies('time_list'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');
        $result['status'] = 200;

        try {

            $q = Time::filter(['search' => $request->search])->latest()->paginate($request->perPage);

            $result['data'] = $q;

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function store(Request $request)
    {

        abort_if(Gate::denies('time_create'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            Time::create($request->all());

            $result['message'] = "រក្សាទុកបានសម្រេច";

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function show(Request $request)
    {

        abort_if(Gate::denies('time_show'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $data = Time::findOrFail($request->id);

            $result['model'] = $data;

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function update(Request $request)
    {

        abort_if(Gate::denies('time_edit'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $d = Time::findOrFail($request->id);

            if($d->update($request->all())) {
                $result['message'] = "កែប្រែបានសម្រេច";
            }

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function delete(Request $request)
    {

        abort_if(Gate::denies('time_delete'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $model = Time::findOrFail($request->id);

            $model->delete();

            $result['message'] = "លុបបានសម្រេច";

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

}
