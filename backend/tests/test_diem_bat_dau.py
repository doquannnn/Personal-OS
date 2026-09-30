import pytest

from personal_os import main


def test_main_thong_bao_backend_san_sang(
    capsys: pytest.CaptureFixture[str],
) -> None:
    main()

    ket_qua = capsys.readouterr()

    assert ket_qua.out == "Backend Personal OS đã sẵn sàng.\n"
