<?php

namespace App\Http\Controllers;

use App\Models\BlackList;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Throwable;

class BlackListController extends Controller
{
	public function list(Request $request)
	{
		abort_if(Gate::denies('blacklist_list'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

		$result['status'] = 200;

		try {
			$query = BlackList::with('student')
				->when($request->student_id, function ($query, $studentId) {
					$query->where('student_id', $studentId);
				})
				->when($request->search, function ($query, $search) {
					$query->where(function ($query) use ($search) {
						$query->where('reason', 'like', '%' . $search . '%')
							->orWhereHas('student', function ($query) use ($search) {
								$query->where('code', 'like', '%' . $search . '%')
									->orWhere('first_name', 'like', '%' . $search . '%')
									->orWhere('last_name', 'like', '%' . $search . '%')
									->orWhere('first_name_latin', 'like', '%' . $search . '%')
									->orWhere('last_name_latin', 'like', '%' . $search . '%')
									->orWhere('phone', 'like', '%' . $search . '%');
							});
					});
				})
				->latest()
				->paginate($request->perPage);

			$result['data'] = $query;
		} catch (Throwable $e) {
			$result['status'] = 201;
			$result['message'] = $e->getMessage();
		}

		return response()->json($result);
	}

	public function store(Request $request)
	{
		abort_if(Gate::denies('blacklist_create'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

		$result['status'] = 200;

		try {
			$data = $request->validate([
				'student_id' => ['required', 'exists:students,id'],
				'reason' => ['nullable', 'string', 'max:255'],
				'from_date' => ['nullable', 'date'],
				'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
			]);

			BlackList::create($data);

			$result['message'] = 'រក្សាទុកបានសម្រេច';
		} catch (Throwable $e) {
			$result['status'] = 201;
			$result['message'] = $e->getMessage();
		}

		return response()->json($result);
	}

	public function show(Request $request)
	{
		abort_if(Gate::denies('blacklist_edit'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

		$result['status'] = 200;

		try {
			$model = BlackList::with('student')->findOrFail($request->id);

			$result['model'] = $model;
		} catch (Throwable $e) {
			$result['status'] = 201;
			$result['message'] = $e->getMessage();
		}

		return response()->json($result);
	}

	public function update(Request $request)
	{
		abort_if(Gate::denies('blacklist_edit'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

		$result['status'] = 200;

		try {
			$model = BlackList::findOrFail($request->id);

			$data = $request->validate([
				'student_id' => ['required', 'exists:students,id'],
				'reason' => ['nullable', 'string', 'max:255'],
				'from_date' => ['nullable', 'date'],
				'to_date' => ['nullable', 'date', 'after_or_equal:from_date'],
			]);

			if ($model->update($data)) {
				$result['message'] = 'កែប្រែបានសម្រេច';
			}
		} catch (Throwable $e) {
			$result['status'] = 201;
			$result['message'] = $e->getMessage();
		}

		return response()->json($result);
	}

	public function delete(Request $request)
	{
		abort_if(Gate::denies('blacklist_delete'), 403, 'អ្នកមិនអាចប្រើប្រាស់ចំណុចនេះទេ។');

		$result['status'] = 200;

		try {
			$model = BlackList::findOrFail($request->id);

			$model->delete();

			$result['message'] = 'លុបបានសម្រេច';
		} catch (Throwable $e) {
			$result['status'] = 201;
			$result['message'] = $e->getMessage();
		}

		return response()->json($result);
	}
}
