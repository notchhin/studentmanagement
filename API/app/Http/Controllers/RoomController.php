<?php

namespace App\Http\Controllers;

use Throwable;
use App\Models\Room;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class RoomController extends Controller
{

    public function list(Request $request)
    {
        abort_if(Gate::denies('room_list'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');
        $result['status'] = 200;

        try {

            $q = Room::filter(['search' => $request->search])->orderBy('room', 'asc')->paginate($request->perPage);

            $result['data'] = $q;

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function store(Request $request)
    {

        abort_if(Gate::denies('room_create'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            Room::create($request->all());

            $result['message'] = "រក្សាទុកបានសម្រេច";

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function show(Request $request)
    {

        abort_if(Gate::denies('room_edit'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $data = Room::findOrFail($request->id);

            $result['model'] = $data;

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

    public function update(Request $request)
    {

        abort_if(Gate::denies('room_edit'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $d = Room::findOrFail($request->id);

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

        abort_if(Gate::denies('room_delete'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

        $result['status'] = 200;

        try {

            $d = Room::findOrFail($request->id);

            if($d->delete()) {
                $result['message'] = "លុបបានសម្រេច";
            }

        } catch (Throwable $e) {
            $result['status'] = 201;
            $result['message'] = $e->getMessage();
        }

        return response()->json($result);
    }

}
