def robust_mean(vs):
    '''Robust mean'''
    if len(vs) <= 2:
        raise ValueError("robust mean: at least two values are necesary")
    return (sum(vs) - max(vs) - min(vs))/(len(vs) - 2)

def test_smoke():
    assert robust_mean([1,2,2,2,2,5]) == 2
